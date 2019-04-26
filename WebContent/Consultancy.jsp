<%@page import="com.ConProvider.ConnectionProviderSingleTone"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.Consultancy.ConsultancyImplements"%>
<%@page import="com.Consultancy.consultancy"%>
<%@page import="com.ConProvider.ConnectionProvider"%>
<title>Consultancy Account | Jobber</title>
<%@ include file="./aheader.jsp"%>
<script type="text/javascript">
<!--

//-->
function ValidatePassword(){
	document.getElementById("pass_match").innerHTML="";
	if(document.getElementById("con_upass").value != document.getElementById("conform_upass").value)
{
	document.getElementById("pass_match").innerHTML="Not Match";
	document.getElementById("conform_upass").value="";
return false;	
}	
}



function copyaddress()
{
	var uname =document.getElementById("con_uname").value;
	document.getElementById("con_email").value = uname;
	
}

</script>



<%@ include file="./alside.jsp"%>
<%@ include file="./arside.jsp"%>


<!-- scope ="page | request | session | application"" -->
<jsp:useBean id= "con" scope= "page" class= "com.Consultancy.ConsultancyModel" >  
</jsp:useBean>

<%
	String Empid =request.getParameter("id");
String btnName ="";
/* ConsultancyModel con =new ConsultancyModel(); */
	if(request.getParameter("id")!=null)
	{	
		consultancy consult = new ConsultancyImplements(); 
		con =  consult.viewById(Empid);
		btnName = "Update";
	} 
	else 
		{
			btnName = "Submit";
			con.setCon_uname("");
			con.setCon_upass("");
			con.setCon_fname("");
			con.setCon_lname("");
			con.setCon_mnumber("");
			con.setCon_wnumber("");
			con.setCon_email("");
			con.setCon_consultancyname("");
			con.setCon_date("");
			con.setCon_street("");
			con.setCon_city("");
			con.setCon_state("Maharashtra");
			con.setCon_country("India");
			con.setCon_zipcode("");
			con.setCon_e_date("");
	
		}
%>

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
            if ((charCode < 65 || charCode > 90)  && (charCode < 97 || charCode > 122   )  )
                return false;
         
            return true;
        }
    </script>
<div class="content-wrapper" style="background-color: white;">

	<div class="box-header" align="center">
		<div class="alert alert-warning alert-dismissible">
			<h2 class="box-title">
				<u><b> CREATE CONSULTANCY ACCOUNT</b></u>
			</h2>
		</div>
	</div>
	<form action="./ConsultancyController" method="post">
		<input type="hidden" name="EditEmpID" value="<%=Empid %>">
		<div class="col-md-12">
			<div class="box box-danger">

				<div class="box-header">
					<div class="alert alert-info alert-dismissible">
						<h4 class="box-title">Consultant Details</h4>
					</div>
				</div>
				<% String error =request.getParameter("errormsg");
            if(error !=null){
            	out.print(error);
            }
            
            %>
				<div class="box-body">

					<div class="col-md-3">
						<div class="form-group">
							<label>Username </label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="email" id="con_uname" name="con_uname" onblur="copyaddress();"
									placeholder="Enter User Name." class="form-control"
									required="required" value="<%= con.getCon_uname()%>"
									alt="Enter User Name" title="Enter User Name"
									oninvalid="setCustomValidity('Plz Enter Valid User Name example:abc@gmail.com')"
									onchange="try{setCustomValidity('')}catch(e){}" />
							</div>
						</div>
					</div>


					<div class="col-md-3">
						<div class="form-group">
							<label>Create Password </label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="password" id="con_upass" name="con_upass"
									value="<%= con.getCon_upass() %>"
									placeholder="Enter Password." class="form-control"
									required="required"
									alt="Please Enter User Password wich is alphanumeric and one Special Symbol like abcd@123"
									title="Please Enter User Password wich is alphanumeric and one Special Symbol like abcd@123 "
									maxlength="8"
									oninvalid="setCustomValidity('Plz Enter Valid Password')"
									min="8" max="8" onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>


					<div class="col-md-3">
						<div class="form-group">
							<label>Confirm Password <span id="pass_match"
								style="color: red;"></span>
							</label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="password" id="conform_upass" name="conform_upass"
									value="<%= con.getCon_upass() %>"
									placeholder="Enter Confirm Password" class="form-control"
									required="required" onblur="ValidatePassword();"
									alt="Please Enter User Password wich is alphanumeric and one Special Symbol like abcd@123"
									title="Please Enter User Password wich is alphanumeric and one Special Symbol like abcd@123 "
									maxlength="8"
									oninvalid="setCustomValidity('Plz Enter Valid Password')"
									min="8" max="8" onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>



					<!-- First Name -->
					<div class="col-md-3">
						<div class="form-group">
							<label>First Name</label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="text" id="con_fname" name="con_fname"
									value="<%= con.getCon_fname() %>"
									placeholder="Enter First Name" class="form-control"
									required="required" alt="Please Enter First Name"
									title="Please Enter First Name"
									onkeypress="return isCharacterKey(event);" maxlength="30"
									oninvalid="setCustomValidity('Plz Enter First Name')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>


					<!-- Last Name -->

					<div class="col-md-3">
						<div class="form-group">
							<label>Last Name </label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="text" id="con_lname" name="con_lname"
									value="<%= con.getCon_lname() %>"
									placeholder="Enter Last Name" class="form-control"
									required="required" alt="Please Enter Last Name"
									title="Please Enter Last Name"
									onkeypress="return isCharacterKey(event);" maxlength="30"
									oninvalid="setCustomValidity('Please Enter Last Name')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>


					<!-- Phone number -->

					<div class="col-md-3">
						<div class="form-group">
							<label>Mobile Number </label>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-phone"></i></span>
								<input type="text" id="con_mnumber" name="con_mnumber"
									value="<%= con.getCon_mnumber() %>"
									placeholder="Enter Mobile Number" class="form-control"
									required="required" alt="Enter Mobile Number"
									title="Enter Mobile Number"
									onkeypress="return isNumberKey(event);" maxlength="10"
									pattern="[0-9]{10}" max="10" min="10"
									oninvalid="setCustomValidity('Please Enter Mobile Number')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>



					<!-- Mobile number -->

					<div class="col-md-3">
						<div class="form-group">
							<label>Whatsapp Number </label>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-whatsapp"></i></span>
								<input type="text" id="con_wnumber" name="con_wnumber"
									value="<%= con.getCon_wnumber()%>"
									placeholder="Enter Whats app Number" class="form-control"
									required="required" alt="Enter Whats app Number"
									title="Enter Whats app Number"
									onkeypress="return isNumberKey(event);" maxlength="10" min="10"
									max="10" pattern="[0-9]{10}"
									oninvalid="setCustomValidity('Please Enter Mobile Number')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>




					<!-- Email Id -->
					<div class="col-md-3">
						<div class="form-group">
							<label>Email Id </label>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-envelope"></i></span> <input type="text"
									id="con_email" name="con_email"
									value="<%= con.getCon_email() %>"
									placeholder="Enter Email Id" class="form-control"
									required="required"
									alt="Please Enter Valid Email Id Example:abc@gmail.com"
									title="Please Enter Valid Email Id Example:abc@gmail.com"
									oninvalid="setCustomValidity('Please Enter Valid Email Id Example:abc@gmail.com')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>

					<div class="col-md-3">
						<div class="form-group">
							<label>Consultancy Name </label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="text" id="con_consultancy" name="con_consultancy"
									value="<%= con.getCon_consultancyname() %>"
									alt="Enter Consultancy Name" title="Enter Consultancy Name"
									placeholder="Enter Consultancy Name" class="form-control"
									required="required"
									oninvalid="setCustomValidity('Please Enter Consultancy Name')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>


					<!--Create Date Start -->
					<div class="col-md-3">
						<div class="form-group">
							<label> Date </label>

							<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<%Date Currrentdate=null;String c_Date="";String E_Date=""; 
								if(con.getCon_date()!="")
								{
								Currrentdate = ConnectionProvider.StringtoDateConvertion(con.getCon_date().toString().trim());
								 SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
								 c_Date = ft.format(Currrentdate);
								}else
								{
									 DateFormat dateformate = new SimpleDateFormat("yyyy-MM-dd");	
									 Date d1 = new Date();
									 c_Date =  dateformate.format(d1);
									 
								} %>

								<input type="date" id="con_date" name="con_date"
									value="<%= c_Date %>" class="form-control pull-right"
									id="datepicker" alt="Select Date" title="Select Date"
									oninvalid="setCustomValidity('Please Select  Date')"
									onchange="try{setCustomValidity('')}catch(e){}" required="required">
							</div>
							<!-- /.input group -->
						</div>
					</div>
					<!--create Date End -->



					<!--Expire Date Start -->
					<div class="col-md-3">
						<div class="form-group">
							<label>Expire Date </label>

							<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>

								<% 
								if(con.getCon_e_date()!=""){
									Currrentdate = ConnectionProvider.StringtoDateConvertion(con.getCon_e_date().toString().trim());
								 SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
								 E_Date = ft.format(Currrentdate);
								}else{
									Calendar c1 = Calendar.getInstance();
									   c1.add(Calendar.YEAR, 1);
									   c1.add(Calendar.DATE,-1);
									   E_Date = new SimpleDateFormat("yyyy-MM-dd").format(c1.getTime());
									  
								} %>

								<input type="date" id="edate" name="edate" value="<%=E_Date%>"
									class="form-control pull-right" id="datepicker"
									alt="Select Date" title="Select Date"
									oninvalid="setCustomValidity('Please Expire Date')"
									onchange="try{setCustomValidity('')}catch(e){}" required="required">
							</div>
							<!-- /.input group -->
						</div>
					</div>
					<!--Expire Date End -->


					<!--Street Start-->


					<div class="col-md-3">
						<div class="form-group">
							<label>Address</label>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-street-view "></i></span> <input type="text"
									id="con_street" name="con_street"
									value="<%= con.getCon_street() %>" placeholder="Enter Address"
									alt="Enter Address" title="Enter Address" class="form-control"
									required="required"
									oninvalid="setCustomValidity('Please Enter Address')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>

					<!--Street End-->


		<%
            try
            {
            	ConnectionProvider.rs=ConnectionProvider.SelectData("select country_name from country");
           %>

					<div class="col-md-3">
						<div class="form-group">
							<label>Country</label>
							<!-- <a href="#" data-toggle="modal"
								data-target="#myModal1"><span style="color: red;"><i
									class="fa fa-plus"></i> Country</span></a> -->
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-flag"></i></span>
								<%-- value="<%= con.getCon_country() %>" --%>
								<select class="form-control select2 select2-hidden-accessible"
									id="con_country" name="con_country" style="width: 100%;"
									tabindex="-1" aria-hidden="true"
									oninvalid="setCustomValidity('Please Select Country')"
									onchange="try{setCustomValidity('')}catch(e){}"
									required="required">
									<option value="">--Select--</option>
									<!-- code for retrive  dropdown -->
									<% while(ConnectionProvider.rs.next()){ 
                 if(ConnectionProvider.rs.getString(1).toString().equalsIgnoreCase(con.getCon_country())){
                %>
									<option selected="selected"><%=ConnectionProvider.rs.getString(1)%></option>
									<% }
                 else
                 {
                 %>

									<option><%=ConnectionProvider.rs.getString(1)%></option>
									<% } 
                 }%>
								</select>
								<%}
           catch(Exception e)
            {	
        	 out.println("wrong entry"+e)  ;
        	 e.printStackTrace();
        	 ConnectionProvider.CloseAllGlobConnection();
            }
         %>
							</div>
						</div>
					</div>



					<%
            try
            {
            	ConnectionProvider.rs=ConnectionProvider.SelectData("select state_name from state");
               /*  ConnectionProvider.ps=ConnectionProviderSingleTone.getInstance().prepareStatement("select state_name from state");
                ConnectionProvider.rs=ConnectionProvider.ps.executeQuery(); */
                    %>

					<div class="col-md-3">
						<div class="form-group">
							<label>State</label>
							<!-- <a href="#" data-toggle="modal"
								data-target="#myModal1"><span style="color: red;"><i
									class="fa fa-plus"></i> State</span></a> -->
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-flag"></i></span>
								<select class="form-control select2 select2-hidden-accessible"
									id="con_state" value="<%= con.getCon_state() %>"
									name="con_state" style="width: 100%;" tabindex="-1"
									aria-hidden="true"
									oninvalid="setCustomValidity('Please Select State')"
									onchange="try{setCustomValidity('')}catch(e){}"
									required="required">
									<option value="">--Select--</option>
									<% while(ConnectionProvider.rs.next()){ 
                 if(ConnectionProvider.rs.getString(1).toString().equalsIgnoreCase(con.getCon_state())){
                %>
									<option selected="selected"><%=ConnectionProvider.rs.getString(1)%></option>
									<% }
                 else
                 {%>
									<option><%=ConnectionProvider.rs.getString(1)%></option>
									<% } 
                 }%>
								</select>
								<%}
           catch(Exception e)
            {	
        	 out.println("wrong entry"+e)  ;
        	 e.printStackTrace();
        	 
            }
         %>
							</div>
						</div>
					</div>




					<%
            try
            {
            	ConnectionProvider.rs=ConnectionProvider.SelectData("select city_name from city");
               /*  ConnectionProvider.ps=ConnectionProviderSingleTone.getInstance().prepareStatement("select city_name from city");
                ConnectionProvider.rs=ConnectionProvider.ps.executeQuery(); */
                

            %>

					<div class="col-md-3">
						<div class="form-group">
							<label>City</label>
							<!-- <a href="#" data-toggle="modal"
								data-target="#myModal"><span style="color: red;"><i
									class="fa fa-plus"></i> City</span></a> -->
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-home"></i></span>
								<%-- value="<%= con.getCon_city() %>" --%>
								<select class="form-control select2 select2-hidden-accessible"
									id="con_city" name="con_city" style="width: 100%;"
									tabindex="-1" aria-hidden="true"
									oninvalid="setCustomValidity('Please Select City')"
									onchange="try{setCustomValidity('')}catch(e){}"
									required="required">
									<option value="">--Select--</option>
									<% while(ConnectionProvider.rs.next()){ 
                 if(ConnectionProvider.rs.getString(1).toString().equalsIgnoreCase(con.getCon_city())){
                %>

									<option selected="selected"><%=ConnectionProvider.rs.getString(1)%></option>


									<% }
                 else
                 {
                	 
                	 
                 
                 
                 %>

									<option><%=ConnectionProvider.rs.getString(1)%></option>
									<% } 
                 }%>
								</select>
								<%}
           catch(Exception e)
            {	
        	 out.println("wrong entry"+e)  ;
        	 e.printStackTrace();
        	
            }
         %>
							</div>
						</div>
					</div>




			


					<div class="col-md-3">
						<div class="form-group">
							<label>ZipCode </label>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-map-pin"></i></span>
								<input type="text" id="con_zipcode" name="con_zipcode"
									placeholder="Enter Zipcode"
									value="<%= con.getCon_zipcode()%>" class="form-control"
									required="required" min="6" maxlength="6" max="6"
									alt="Please Enter Zip Code" title="Please Enter Zip Code"
									onkeypress="return isNumberKey(event);"
									oninvalid="setCustomValidity('Please Enter Six Digit Zip Code')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>
					<div class="col-md-12">&nbsp;</div>

					<div class="col-md-2" style="position: relative; left: 350px">
						<button type="submit" class="btn btn-block btn-success btn-lg"
							id="btn_submit" onclick="return ValidatePassword();"
							name="btn_submit" value="<%=btnName %>"><%=btnName%></button>

					</div>
					<div class="col-md-2" style="position: relative; left: 350px">
						<button type="reset" class="btn btn-block btn-warning btn-lg">Reset</button>
					</div>

					<div class="col-md-12">&nbsp;</div>
				</div>




			</div>
	</form>

	<!-- body content wrapper end -->
</div>
</div>

<!-- .1] For City start -->
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<form action="./AddNature" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add City</h4>
				</div>
				<div class="modal-body">
					<div class="form-group has-success">
						<input type="text" class="form-control" name="inputSuccess"
							id="inputSuccess" placeholder="Enter city ">
					</div>
				</div>
				<div class="col-md-3">
					<input type="submit" style="position: relative; left: 215px"
						value="ADD" name="btnsubmit" class="btn btn-block btn-success">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</form>

	</div>
</div>
<!-- .1] For City end -->



<!-- .2] For State start -->
<!-- Modal -->
<div class="modal fade" id="myModal1" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<form action="./AddNature" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add State</h4>
				</div>
				<div class="modal-body">
					<div class="form-group has-success">
						<input type="text" class="form-control" name="inputSuccess"
							id="inputSuccess" placeholder="Enter State ">
					</div>
				</div>
				<div class="col-md-3">
					<input type="submit" style="position: relative; left: 215px"
						value="ADD" name="btnsubmit" class="btn btn-block btn-success">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</form>

	</div>
</div>
<!-- .2] For City end -->


<!-- .1] For Country start -->
<!-- Modal -->
<div class="modal fade" id="myModal2" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<form action="./AddNature" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add Country</h4>
				</div>
				<div class="modal-body">
					<div class="form-group has-success">
						<input type="text" class="form-control" name="inputSuccess"
							id="inputSuccess" placeholder="Enter country ">
					</div>
				</div>
				<div class="col-md-3">
					<input type="submit" style="position: relative; left: 215px"
						value="ADD" name="btnsubmit" class="btn btn-block btn-success">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</form>

	</div>
</div>
<!-- .3] For Country end -->





<%@ include file="./afooter.jsp"%>
