<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ConProvider.ConnectionProvider"%>
<%@page import="java.util.Date"%>
<%@page import="com.Interview.Schedulespkg.SchedulesImplements"%>
<%@page import="com.Interview.Schedulespkg.SchedulesInterModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Interview.Schedulespkg.SchedulesInterviewInf"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Schedule Interview | Jobber</title>
</head>
<body>
	<%@ include file="./aheader.jsp"%>
	<%@ include file="./alside.jsp"%>
	<%@ include file="./arside.jsp"%>

<script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
    </script>

<script type="text/javascript">
        function isCharacterKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if ( (charCode < 65 || charCode > 90)  && (charCode < 97 || charCode > 122   )  )
            {
            	return false;
            }
             
          return true;
           
        }
    </script>

	<%
		String btn_value = "Schedule";
		int jobid = 0;
		int Candidate_id = 0;
		int schedduls_id=0;
		
		if (session.getAttribute("Applied_Candidate_Job_id") != null) {
			jobid = Integer.parseInt(session.getAttribute("Applied_Candidate_Job_id").toString().trim());
			Candidate_id = Integer.parseInt(session.getAttribute("Applied_Candidate_id").toString().trim());
		}

		SchedulesInterModel sSim = new SchedulesInterModel();

		if (request.getParameter("Edit_id") != null) {
			SchedulesInterviewInf sSii = new SchedulesImplements();
			String id = request.getParameter("Edit_id").toString().trim();
			sSim = sSii.viewById(Integer.parseInt(id));
			schedduls_id = Integer.parseInt(request.getParameter("Edit_id").toString().trim());
			btn_value = "Update";
		} else {
			sSim.setCandidate_Name(""); 
			sSim.setInterview_Date(null);
			sSim.setContact_person_name("");
			sSim.setContact_person_number("");
			sSim.setVanue_Details("");
			sSim.setJob_id(jobid);
			sSim.setCandidate_Id(Candidate_id);

		}
	%>

	<div class="content-wrapper" style="background-color: white;">

		<div class="box-header" align="center">
			<div class="alert alert-warning alert-dismissible">
				<h2 class="box-title">
					<u><b> <a href="">Schedule Interview </a>
					</b></u>
				</h2>
			</div>
		</div>


		<div class="col-md-12">
			<form action="./SchedulesInterviewController" method="post">
				<input type="hidden" name="hdn_job_id" id="hdn_job_id"
					value="<%=sSim.getJob_id()%>" /> <input type="hidden"
					name="hdn_candidate_id" id="hdn_candidate_id"
					value="<%=sSim.getCandidate_Id()%>" /> <input type="hidden"
					name="hdn_schedules_id" id="hdn_schedules_id"
					value="<%=schedduls_id%>" />

				<div class="box box-danger">
					<div class="box-body">
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label>Interview Name </label>
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i></span>
										<input type="text" id="txt_Interview_Name"
											name="txt_Interview_Name" 
											placeholder="Enter Interview Name."
											class="form-control" value="<%=sSim.getCandidate_Name()%>"
											required="required"
										    oninvalid="setCustomValidity('Enter Interview Name')"
											onchange="try{setCustomValidity('')}catch(e){}"
						
											>
										<%-- value="<%= jpm.getTxt_job_Title()%>" --%>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>Interview Date</label>
									<div class="input-group">


										<%
											Date Currrentdate = null;
											String c_Date = "";
											String E_Date = "";
											if (sSim.getInterview_Date() != null) {
												Currrentdate = ConnectionProvider.StringtoDateConvertion(sSim.getInterview_Date().toString().trim());
												SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
												c_Date = ft.format(Currrentdate);
											} else {
												DateFormat dateformate = new SimpleDateFormat("yyyy-MM-dd");
												Date d1 = new Date();
												c_Date = dateformate.format(d1);
												/* System.out.println(dateformate.format(d1)); */
											}
										%>


										<span class="input-group-addon"> <i
											class="fa fa-calendar"></i></span> <input type="date"
											id="txt_Interview_Date" name="txt_Interview_Date"
											value="<%=c_Date%>" class="form-control" required="required"
											 oninvalid="setCustomValidity('Please Select Interview Date')"
											onchange="try{setCustomValidity('')}catch(e){}">
										<%-- value="<%= jpm.getTxt_job_Title()%>" --%>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="row">
									<div class="col-md-6 col-sm-6 col-xs-6 col-lg-6">

										<div class="form-group">
											<label>Time From </label>
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="fa fa-clock-o"></i></span> <input type="time"
													id="txt_Int_Start_from" name="txt_Int_Start_from"
													min="9:00" max="18:00" class="form-control"
													value="<%=sSim.getInterview_start_time()%>"
													required="required"
													 oninvalid="setCustomValidity('Please Select Interview Time From')"
											onchange="try{setCustomValidity('')}catch(e){}">
												<%-- value="<%= jpm.getTxt_job_Title()%>" --%>
											</div>
										</div>
									</div>

									<div class="col-md-6 col-sm-6 col-xs-6 col-lg-6">
										<div class="form-group">
											<label>Time To</label>
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="fa fa-clock-o"></i></span> <input type="time"
													id="txt_Int_Start_to" name="txt_Int_Start_to" min="9:00"
													max="18:00" class="form-control" required="required"
													value="<%=sSim.getInterview_end_time()%>"
													 oninvalid="setCustomValidity('Please Select Interview Time To')"
											onchange="try{setCustomValidity('')}catch(e){}">
												<%-- value="<%= jpm.getTxt_job_Title()%>" --%>
											</div>
										</div>
									</div>

								</div>

							</div>




						</div>


						<div class="row">



							<div class="col-md-4">
								<div class="form-group">
									<label>Contact Person</label>
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i></span>
										<input type="text" id="txt_Contact_person"
											name="txt_Contact_person" placeholder="Enter Contact Person"
											class="form-control" required="required"
											value="<%=sSim.getContact_person_name()%>"
											 oninvalid="setCustomValidity('Please Enter Contact Person Name')"
											onchange="try{setCustomValidity('')}catch(e){}">
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>Contact Per. Number</label>
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-phone"></i></span>
										<input type="text" id="txt_Contact_Per_Number"
											name="txt_Contact_Per_Number"
											placeholder="Contact Person Number" maxlength="10" min="10" max="10"
											class="form-control" required="required"
											value="<%=sSim.getContact_person_number()%>"
											onkeypress="return isNumberKey(event);" 
											oninvalid="setCustomValidity('Please Contact Person Number.')"
											onchange="try{setCustomValidity('')}catch(e){}">
									</div>
								</div>
							</div>


							<div class="col-md-4">
								<div class="form-group">
									<label>Vanue Details</label>
									<div class="input-group">
										<span class="input-group-addon"> <i
											class="fa fa-address-book fa-2x"></i></span>
										<textarea rows="3" class="form-control"
											placeholder="enter the Vanes Detials" id="txt_Vanue"
											name="txt_Vanue" required="required"
											oninvalid="setCustomValidity('Please Enter Detaild Address of Company.')"
											onchange="try{setCustomValidity('')}catch(e){}"
											><%=sSim.getVanue_Details()%></textarea>

									</div>
								</div>
							</div>








						</div>

						<div class="box-footer">
							<div class="col-md-6">
								<div class="form-group">
									<div class="input-group">
										<button type="submit" id="btn_ScheduleInterview"
											name="btn_Submit" class="btn btn-success"
											value="<%=btn_value%>">
											<i class="fa fa-save"></i> &nbsp;
											<%=btn_value%>
										</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="reset" id="btn_reset" name="btn_reset"
											class="btn btn-warning">
											<i class="fa fa-refresh"></i> &nbsp; Reset
										</button>
									</div>
								</div>
							</div>
						</div>


					</div>
			</form>
		</div>




		<div class="row">


			<div class="col-md-12 col-xs-12 col-lg-12 col-sm-12">
				<div class="box box-info">
					<div class="box-header">

						<h2 class="box-title">
							<u><b> <a href="">Candidate Details</a>
							</b></u>
						</h2>

					</div>
					<div class="box-body">
						<div class="row">
							<div class="col-md-12 col-xs-12 col-sm-12 col-lg-12">
								<table class="table table-responsive">
									<thead>
										<tr>
											<th>Sr No</th>
											<th>Int. Name</th>
											<th>Int. Date</th>
											<th>Time</th>
											<th>Contact Person</th>
											<th>Contact Number</th>
											<th>Address</th>
											<th>Action</th>

										</tr>
									</thead>
									<tbody>


										<%
											SchedulesInterviewInf sii = null;
											ArrayList<SchedulesInterModel> Details = null;
											try {

												if (request.getParameter("txt_search") != null) {
													sii = new SchedulesImplements();
													String serch = request.getParameter("txt_search").toString().trim();
													Details = sii.ViewAllQuery(serch);
												} else {
													sii = new SchedulesImplements();
													Details = sii.ViewAll();
												}
												int a = 1;
												for (SchedulesInterModel sim : Details) {
										%>

										<form action="./SchedulesInterviewController" method="post">

											<tr>
												<td><%=a%><input type="hidden" name="Edit_id"
													value="<%=sim.getSchedules_Id()%>" /></td>
												<td><%=sim.getCandidate_Name()%></td>
												<td><%=sim.getInterview_Date()%></td>
												<td><%=sim.getInterview_start_time() + "-" + sim.getInterview_end_time()%></td>
												<td><%=sim.getContact_person_name()%></td>
												<td><%=sim.getContact_person_number()%></td>
												<td><%=sim.getVanue_Details()%></td>
												<td>
													<button type="submit" id="btn_PostJob" name="btn_Submit"
														class="btn btn-warning btn-sm" value="Edit"
														alt="Edit Details" title="Edit Details">
														<i class="fa fa-edit "></i>
													</button>

													<button type="submit" id="btn_PostJob" name="btn_Submit"
														class="btn btn-danger btn-sm" value="Delete" alt="Delete"
														title="Delete"
														onclick="return confirm('Do you want to Reject Candidate ?');">
														<i class="fa fa-trash "></i>
													</button>
												</td>
											</tr>
										</form>

										<%
											a = ++a;
												}
											} catch (Exception ex) {
												ex.printStackTrace();
											} finally {
												if (sii != null) {
													sii = null;
												}

											}
										%>
									</tbody>

								</table>

							</div>
						</div>
					</div>



				</div>
			</div>



		</div>




	</div>



	<%@ include file="./afooter.jsp"%>
</body>
</html>