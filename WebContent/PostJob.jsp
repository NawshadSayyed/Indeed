<%@page import="java.sql.Connection"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ConProvider.ConnectionProvider"%>
<%@page import="java.util.Date"%>
<%@page import="com.Company.jobPost.JobPostableImplement"%>
<%@page import="com.Company.jobPost.JobPostable"%>
<%@page import="com.Company.jobPost.JobPostModel"%>
<title>Post Job | Jobber</title>
<link rel="shortcut icon" href="assets/images/jobber1-117x93.png"
	type="image/x-icon">
<%@ include file="./aheader.jsp"%>
<%@ include file="./alside.jsp"%>
<%@ include file="./arside.jsp"%>

<script type="text/javascript">
function validateexperiance() {
	if (document.getElementById('ddl_Exp_Type').selectedIndex == 2) {
	    
	    if (Number(document.getElementById('txt_Total_Exp').value) <= 0){
	    	alert("Please Enter Total Expenriance");
	    }
	    
	    document.getelementbyid("").focus();
	    return false;
	}
	
}  


function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;
}

</script>

<div class="content-wrapper" style="background-color: white;">

	<!-- <div class="box-header" align="center">
		<div class="alert alert-warning alert-dismissible">
			<h2 class="box-title">
				<u><b> Add New  Job </b></u>
			</h2>
		</div>
	</div> -->
<jsp:useBean id="jpm" scope="page" class="com.Company.jobPost.JobPostModel" ></jsp:useBean>

	<%
	String btn_value =null;
	
	JobPostable jp =null;
	try{
	if(request.getParameter("Edit_id")!=null)
	{
		try{
		String Edit_id = request.getParameter("Edit_id").toString().trim();
		jp =  new JobPostableImplement();
		jpm =  jp.viewById(am,Edit_id);
		btn_value ="Update";
		}
		catch(Exception x)
		{
		x.printStackTrace();
		btn_value ="Update";
		}
	}
	else{
		jpm = new JobPostModel();
		btn_value ="Post";
		jpm.setTxt_job_Title("");
		jpm.setTxt_Company_Name("");
		jpm.setTxt_job_location("");
		jpm.setDdl_Job_Type("");
		jpm.setTxt_Sal_From(0);
		jpm.setTxt_Sal_To(0);
		jpm.setDdl_Salary_Type("");
		jpm.setTxt_JobSummary("");
		jpm.setTxt_Job_Responsibility("");
		jpm.setTxt_Exp_qulif_skills("");
		jpm.setDdl_Min_Qualification("");
		jpm.setDdl_Exp_Type("");
		jpm.setTxt_Total_Exp(0);
		jpm.setDdl_Post_Status("");
		jpm.setTxt_job_post_date("");
		jpm.setTxt_txt_post_by("");
		jpm.setTxt_txt_No_vacancies(0);
		jpm.setDdl_job_category("");
	}
	}catch(Exception es){
		es.printStackTrace();
	}
	%>
	<form action="./JobPostController" method="post">
		<div class="col-md-12">
			<div class="box box-info">
				<div class="box-header">
					<div class="alert alert-info alert-dismissible">
						<h4 class="box-title">Job Description</h4>
					</div>
				</div>
				<div class="box-body">
					<div class="row">
						<!--For Job Title-->
						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="form-group">
								<label>Job Title </label>
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-user"></i></span>
									<input type="text" id="txt_job_Title" name="txt_job_Title"
										placeholder="Enter Job Title." class="form-control"
										value="<%= jpm.getTxt_job_Title()%>" required="required"
										alt="Enter Job Title" title="Enter Job Title"
										oninvalid="setCustomValidity('Please Enter Job Title')"
										onchange="try{setCustomValidity('')}catch(e){}">
								</div>
							</div>
						</div>
						<!--For Job Title-->

						<!--For Company Name  -->
						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="form-group">
								<label>Company Name </label>
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-user"></i></span>
									<input type="text" id="txt_Company_Name"
										name="txt_Company_Name" placeholder="Enter Company Name."
										class="form-control" value="<%= jpm.getTxt_Company_Name() %>"
										required="required" alt="Enter Company Name "
										title="Enter Company Name "
										oninvalid="setCustomValidity('Please Company Name ')"
										onchange="try{setCustomValidity('')}catch(e){}">
								</div>
							</div>
						</div>
						<!--For Company Name  -->


						<%Date Currrentdate=null;String c_Date="";String E_Date=""; 
								if(jpm.getTxt_job_post_date()!="")
								{
							    Currrentdate = ConnectionProvider.StringtoDateConvertion(jpm.getTxt_job_post_date().toString().trim());
								 SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
								 c_Date = ft.format(Currrentdate);
								}else
								{
									 DateFormat dateformate = new SimpleDateFormat("yyyy-MM-dd");	
									 Date d1 = new Date();
									 c_Date =  dateformate.format(d1);
									 /* System.out.println(dateformate.format(d1)); */
								} %>




						<!--For Post Date -->
						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="form-group">
								<label>Post Date </label>
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-user"></i></span>
									<input type="date" id="txt_post_date" name="txt_job_post_date"
										class="form-control" value="<%=c_Date %>" required="required"
										alt="Select Date" title="Select Date"
										oninvalid="setCustomValidity('Please Select  Date')"
										onchange="try{setCustomValidity('')}catch(e){}">
								</div>
							</div>
						</div>
						<!--For Post Date -->


					</div>



					<div class="row">

						<!--For txt post by-->
						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="form-group">
								<label>Post By </label>
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-user"></i></span>
									<input type="text" id="txt_post_by" name="txt_txt_post_by"
										placeholder="Enter Post By." class="form-control"
										value="<%= jpm.getTxt_txt_post_by() %>" required="required"
										alt="Enter Post By" title="Enter Post By"
										oninvalid="setCustomValidity('Please Enter Job Post By Person Name')"
										onchange="try{setCustomValidity('')}catch(e){}">
								</div>
							</div>
						</div>
						<!--For txt post by-->

						<!--For txt No vacancies  -->
						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="form-group">
								<label>No Of Vacancies </label>
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-user"></i></span>
									<input type="text" id="txt_No_vacancies"
										name="txt_txt_No_vacancies" maxlength="4"
										placeholder="Enter Number Of Vacancies." class="form-control"
										required="required" onkeypress="return isNumberKey(event);"
										value="<%= jpm.getTxt_txt_No_vacancies() %>"
										alt="Enter Number Of Vacancies"
										title="Enter Number Of Vacancies"
										oninvalid="setCustomValidity('Please Enter Number Of Vacancies')"
										onchange="try{setCustomValidity('')}catch(e){}">
								</div>
							</div>
						</div>
						<!--For txt No vacancies  -->


						<!--For Job Location -->
						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="form-group">
								<label>Job Location </label>
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-user"></i></span>
									<input type="text" id="txt_job_location"
										name="txt_job_location" placeholder="Enter Job Location .."
										class="form-control" required="required"
										value="<%= jpm.getTxt_job_location() %>"
										alt="Enter Job Location" title="Enter Job Location"
										oninvalid="setCustomValidity('Please Enter Job Location')"
										onchange="try{setCustomValidity('')}catch(e){}">
								</div>
							</div>
						</div>
						<!--For Job Location -->


					</div>


					<div class="row">

						<!-- for job type -->
						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="form-group">
								<label>Job Type </label>
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-user"></i></span>
									<select id="ddl_Job_Type" name="ddl_Job_Type"
										class="form-control" required="required"
										title="Select Job Type"
										oninvalid="setCustomValidity('Please Select Job Type')"
										onchange="try{setCustomValidity('')}catch(e){}">
										<option value="">-- Job Type--</option>
										<%
							ArrayList<String> jobtype = new ArrayList();
							jobtype.add("Commission");jobtype.add("Contract");jobtype.add("Fresher");jobtype.add("Full Time");
							jobtype.add("Internship");jobtype.add("Part Time");jobtype.add("Temporary");jobtype.add("Volunteer");
							jobtype.add("Walk-In");
							if (jpm.getDdl_Job_Type() != "")
							{
								for (String s : jobtype) {
													if (s.equalsIgnoreCase(jpm.getDdl_Job_Type())) {
										%>
										<option value="<%=s%>" selected="selected"><%=s%></option>
										<%
											} else {
										%>
										<option value="<%=s%>"><%=s%></option>
										<%
											}

												}

											} else {
												for (String s : jobtype) {
										%>
										<option value="<%=s%>"><%=s%></option>
										<%
											}
											}
										%>



										<!-- <option value="Commission">Commission</option>
							<option value="Contract">Contract</option>
							<option value="Fresher" >Fresher</option>
							<option value="Full Time">Full Time</option>
							<option value="Internship">Internship</option>
							<option value="Part Time">Part Time</option>
							<option value="Temporary">Temporary</option>
							<option value="Volunteer">Volunteer</option>
							<option value="Walk-In">Walk-In</option> -->
									</select>


								</div>
							</div>
						</div>
						<!-- for job type -->
						<!-- for Salary  -->
						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="form-group">
								<label>Salary </label>
								<div class="row">
									<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6 col-xl-6">
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i></span>
											<input type="text" id="txt_Sal_From" name="txt_Sal_From" maxlength="7"
												placeholder="From" class="form-control" onkeypress="return isNumberKey(event);"
												value="<%=jpm.getTxt_Sal_From() %>" required="required"
												alt="Enter Salary" title="Enter Salary"
												oninvalid="setCustomValidity('Please Enter Salary From ')"
												onchange="try{setCustomValidity('')}catch(e){}">
										</div>
									</div>


									<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6 col-xl-6">
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i></span>
											<input type="text" id="txt_Sal_To" name="txt_Sal_To"
												placeholder="To." class="form-control" onkeypress="return isNumberKey(event);"
												value="<%=jpm.getTxt_Sal_To() %>" required="required" maxlength="7"
												alt="Enter Salary To" title="Enter Salary To"
												oninvalid="setCustomValidity('Please Enter Salary To ')"
												onchange="try{setCustomValidity('')}catch(e){}">
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- for Salary  -->



						<!-- for Salary Type -->


						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="form-group">
								<label>Salary Type</label>
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-user"></i></span>
									<select id="ddl_Salary_Type" name="ddl_Salary_Type"
										class="form-control" required="required"
										title="Select Salary Type"
										oninvalid="setCustomValidity('Please Select Salary Type')"
										onchange="try{setCustomValidity('')}catch(e){}">
										<option value="">--Salary Type--</option>


										<% 
					
					String sb[] = { "Per Annum","Per Month","Half Year","15 Days","Weekly","Daily"};
					if (jpm.getDdl_Salary_Type() != "")
					{
						for (String s : sb)
						{
							if (s.equalsIgnoreCase(jpm.getDdl_Salary_Type())) {
								%>
										<option value="<%=s%>" selected="selected"><%=s%></option>
										<%
									} else {
								%>
										<option value="<%=s%>"><%=s%></option>
										<%
									}
						}
					}else {
						for (String s : sb) {
				%>
										<option value="<%=s%>"><%=s%></option>
										<%
					}
					}
					
					
					
					
					%>



										<!-- <option value="Per Annum">Per Annum</option>
							<option value="Per Month">Per Month</option>
							<option value="Half Year">Half Year</option>
							<option value="15 Days">15 Days</option>
							<option value="Weekly">Weekly</option>
							<option value="Daily">Daily</option> -->
									</select>


								</div>
							</div>
						</div>
						<!-- for Salary  Type-->

					</div>



					<!--Div start for job description / respomnsiblity /experiance -->
					<div class="row">

						<!--For Job Summry-->
						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="form-group">
								<label>Job Summary </label>
								<div class="input-group">
									<textarea rows="5" cols="60" class="form-control"
										placeholder="Enter Job Summary" id="txt_JobSummary"
										name="txt_JobSummary" required="required"
										title="Please Enter Job Summary "
										oninvalid="setCustomValidity('Please Enter Job Summary ')"
										onchange="try{setCustomValidity('')}catch(e){}"><%=jpm.getTxt_JobSummary()%></textarea>



								</div>
							</div>
						</div>
						<!--For Job Title-->

						<!--For Job Responsibility-->
						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="form-group">
								<label>Job Responsibility </label>
								<div class="input-group">

									<textarea rows="5" cols="60" class="form-control"
										placeholder="Enter Job Responsibility "
										id="txt_Job_Responsibility" name="txt_Job_Responsibility"
										required="required" title="Please Enter Job Responsibility"
										oninvalid="setCustomValidity('Please Job Responsibility')"
										onchange="try{setCustomValidity('')}catch(e){}"><%=jpm.getTxt_Job_Responsibility()%></textarea>

								</div>
							</div>
						</div>
						<!--For Job responsibility-->



						<!--For Required Experiance/Qualification/Skils-->
						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="form-group">
								<label>Experience / Qualification / Skills </label>
								<div class="input-group">

									<textarea rows="5" cols="60" class="form-control"
										placeholder="Enter Job Experience" id="txt_Exp_qulif_skills"
										name="txt_Exp_qulif_skills" required="required"
										title="Please Enter Experience / Qualification / Skills "
										oninvalid="setCustomValidity('Please Enter Experience / Qualification / Skills ')"
										onchange="try{setCustomValidity('')}catch(e){}"> <%=jpm.getTxt_Exp_qulif_skills()%></textarea>
								</div>
							</div>
						</div>
						<!--For Required Experiance/Qualification/Skils-->



					</div>


					<!--Div End for job description / respomnsiblity /experiance -->



					<div class="row">

						<!--For Min. Qualification-->
						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="form-group">
								<label>Min. Qualification </label>
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-user"></i></span>
									<select id="ddl_Min_Qualification" name="ddl_Min_Qualification"
										class="form-control" required="required"
										title="Please Select Min. Qualification "
										oninvalid="setCustomValidity('Please Select Min. Qualification  ')"
										onchange="try{setCustomValidity('')}catch(e){}">
										<option value="">--Select Qualification --</option>

										<% 
					
					String Qualification[] = { "SSC","HSSC","Graduate","Post-Graduate","Bachelor","ITI","Polytechnic"};
					if (jpm.getDdl_Min_Qualification() != "")
					{
						for (String s : Qualification)
						{
							if (s.equalsIgnoreCase(jpm.getDdl_Min_Qualification())) {
								%>
										<option value="<%=s%>" selected="selected"><%=s%></option>
										<%
									} else {
								%>
										<option value="<%=s%>"><%=s%></option>
										<%
									}
						}
					}else {
						for (String s : Qualification) {
				%>
										<option value="<%=s%>"><%=s%></option>
										<%
					}
					}
					
					
					
					
					%>


									</select>
								</div>
							</div>
						</div>
						<!--For Min. Qualification -->

						<!--For Experience-->
						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="row">
								<div class="col-md-6 col-sm-6 col-xs-6 col-lg-6">
									<div class="form-group">
										<label>Experience </label>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i></span>
											<select id="ddl_Exp_Type" name="ddl_Exp_Type"
												class="form-control" required="required"
												title="Please Please Select Experience "
												oninvalid="setCustomValidity('Please Select Experience  ')"
												onchange="try{setCustomValidity('')}catch(e){}">
												<option value="">--Select--</option>

												<% 
					
					String Experience[] = { "Fresher","Experience"};
					if (jpm.getDdl_Exp_Type() != "")
					{
						for (String s : Experience)
						{
							if (s.equalsIgnoreCase(jpm.getDdl_Exp_Type())) {
								%>
												<option value="<%=s%>" selected="selected"><%=s%></option>
												<%
									} else {
								%>
												<option value="<%=s%>"><%=s%></option>
												<%
									}
						}
					}else {
						for (String s : Experience) {
				%>
												<option value="<%=s%>"><%=s%></option>
												<%
					}
					}
					
					
					
					
					%>


												<!-- <option value="Fresher">Fresher</option>
								<option value="Experience">Experience</option> -->

											</select>
										</div>
									</div>
								</div>


								<div class="col-md-6 col-sm-6 col-xs-6 col-lg-6">
									<div class="form-group">
										<label>If Experiance</label>
										<div class="input-group">

											<input type="text" id="txt_Total_Exp" name="txt_Total_Exp"
												placeholder="Enter Yers of Experiance" class="form-control" onkeypress="return isNumberKey(event);"
												value="<%= jpm.getTxt_Total_Exp() %>" maxlength="2"
												title="Please Enter Experience "
												oninvalid="setCustomValidity('Please Enter Experience  ')">
										</div>
									</div>
								</div>

							</div>


						</div>
						<!--For Job Experience-->


						<!--For Post Status-->
						<div class="col-md-4 col-lg-4 col-sm-4 col-xs-4 col-xl-4">
							<div class="row">
								<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6 col-xl-6">
									<div class="form-group">
										<label>Job Category </label>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i></span>
											<select id="ddl_Job_category" name="ddl_Job_category"
												class="form-control" required="required"
												title="Please Enter Job Category "
												oninvalid="setCustomValidity('Please Enter Job Category ')"
												onchange="try{setCustomValidity('')}catch(e){}">
												<option value="">--Select--</option>



												<% 
					
					String jobCategory[] = { "Agriculture - Food and Natural Resources","Architecture and Construction","Arts - Audio/Video "+
					"Technology and Communications","Business Management and Administration","Education and Training","Finance","Government and "+
					"Public Administration","Health Science","Hospitality and Tourism","Human Services","Info"+
					"rmation Technology - Software","Information Technology-Hardware","Law / Public Safety / Corrections and Security","Manufacturing","Mar"+
					"keting / Sales and Service","Science / Technology / Engineering and Mathematics","Transportation / Distribution and Logistics"};
					if (jpm.getDdl_job_category() != "")
					{
						for (String s : jobCategory)
						{
							if (s.equalsIgnoreCase(jpm.getDdl_job_category())) {
								%>
												<option value="<%=s%>" selected="selected"><%=s%></option>
												<%
									} else {
								%>
												<option value="<%=s%>"><%=s%></option>
												<%
									}
						}
					}else {
						for (String s : jobCategory) {
				%>
												<option value="<%=s%>"><%=s%></option>
												<%
					}
					}
					
					
					
					
					%>


											</select>
										</div>
									</div>
								</div>
								<div class="col-md-6 col-lg-6 col-sm-6 col-xs-6 col-xl-6">
									<div class="form-group">
										<label>Post Status </label>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i></span>
											<select id="ddl_Post_Status" name="ddl_Post_Status"
												class="form-control" required="required"
												title="Please Enter Job Category "
												oninvalid="setCustomValidity('Please Select Post Status. ')"
												onchange="try{setCustomValidity('')}catch(e){}">
												<option value="">--Select--</option>


												<% 
					
					String jobStatus[] = { "Open","Close"};
					if (jpm.getDdl_Post_Status() != "")
					{
						for (String s : jobStatus)
						{
							if (s.equalsIgnoreCase(jpm.getDdl_Post_Status())) {
								%>
												<option value="<%=s%>" selected="selected"><%=s%></option>
												<%
									} else {
								%>
												<option value="<%=s%>"><%=s%></option>
												<%
									}
						}
					}else {
						for (String s : jobStatus) {
				%>
												<option value="<%=s%>"><%=s%></option>
												<%
					}
					}
					
					
					
					
					%>

											</select>
										</div>
									</div>
								</div>
							</div>



						</div>
						<!--For Post Status-->


					</div>








				</div>

				<div class="box-footer">
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group">
								<button type="submit" onsubmit="return validateexperiance();" id="btn_PostJob" name="btn_PostJob"
									class="btn btn-success btn-lg" value="<%=btn_value %>">
									<i class="fa fa-save"></i> &nbsp;
									<%=btn_value %>
								</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="reset" id="btn_reset" name="btn_reset"
									class="btn btn-warning btn-lg">
									<i class="fa fa-refresh"></i> &nbsp; Reset
								</button>
							</div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</form>

</div>



<%@ include file="./afooter.jsp"%>
