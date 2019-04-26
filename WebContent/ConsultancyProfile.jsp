<%@page import="com.ConProvider.ConnectionProviderSingleTone"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.Consultancy.ConsultancyImplements"%>
<%@page import="com.Consultancy.consultancy"%>
<%@page import="com.Consultancy.ConsultancyModel"%>
<%@page import="com.ConProvider.ConnectionProvider"%>
<%@page import="com.mysql.jdbc.Connection"%>


<%@ include file="./aheader.jsp"%>
<script type="text/javascript">
<!--
	//-->
	function ValidatePassword() {
		document.getElementById("pass_match").innerHTML = "";
		if (document.getElementById("con_upass").value != document
				.getElementById("conform_upass").value) {
			document.getElementById("pass_match").innerHTML = "Password Not Match";
			document.getElementById("conform_upass").value = "";
			return false;
		}
	}
</script>



<%@ include file="./alside.jsp"%>
<%@ include file="./arside.jsp"%>

<jsp:useBean id= "con" scope= "page" class= "com.Consultancy.ConsultancyModel">  </jsp:useBean>
<%
/* 	ConsultancyModel con = new ConsultancyModel(); */
	String Empid = request.getParameter("id");
	consultancy consult = new ConsultancyImplements();
	try {

		con = consult.viewById(String.valueOf(am.getResgis_id()));
	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>

<div class="content-wrapper" style="background-color: white;">

	<div class="box-header" align="center">
		<div class="alert alert-warning alert-dismissible">
			<h2 class="box-title">
				<Strong style="text-decoration: underline;">PROFILE</Strong>
			</h2>
		</div>
	</div>
	<form action="./ConsultancyController" method="post">
		<input type="hidden" name="EditEmpID" value="<%=am.getResgis_id()%>">
		<div class="col-md-12">
			<div class="box box-info">

				<!-- <div class="box-header">
					<div class="alert alert-info alert-dismissible">
						<h4 class="box-title">Organization Information</h4>
					</div>
				</div> -->
				<%
					String error = request.getParameter("errormsg");
					if (error != null) {
						out.print(error);
					}
				%>
				<div class="box-body">

					<div class="col-md-3" style="display: none;">
						<div class="form-group">
							<label>Username </label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="email" id="con_uname" name="con_uname"
									placeholder="Enter Username.." class="form-control"
									required="true" value="<%=con.getCon_uname()%>"
									readonly="readonly" />
							</div>
						</div>
					</div>


					<div class="col-md-3" style="display: none;">
						<div class="form-group">
							<label>Create Password </label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="password" id="con_upass" name="con_upass"
									value="<%=con.getCon_upass()%>"
									placeholder="Enter Password.." class="form-control"
									required="true" readonly="readonly">
							</div>
						</div>
					</div>


					<div class="col-md-3" style="display: none;">
						<div class="form-group">
							<label>Confirm Password <span id="pass_match"
								style="color: red;"></span>
							</label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="password" id="conform_upass" name="conform_upass"
									value="<%=con.getCon_upass()%>"
									placeholder="Enter Password.." class="form-control"
									required="true" onblur="ValidatePassword();"
									readonly="readonly">
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
									value="<%=con.getCon_fname()%>"
									placeholder="Enter first name.." class="form-control"
									required="true" readonly="readonly">
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
									value="<%=con.getCon_lname()%>"
									placeholder="Enter Last Name.." class="form-control"
									required="true" readonly="readonly">
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
									value="<%=con.getCon_mnumber()%>"
									placeholder="Enter Mobile Number.." class="form-control"
									required="true" readonly="readonly">
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
									value="<%=con.getCon_wnumber()%>"
									placeholder="Enter Mobile Number.." class="form-control"
									required="true" readonly="readonly">
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
									value="<%=con.getCon_email()%>"
									placeholder="Enter Email Id.." class="form-control"
									required="true" readonly="readonly">
							</div>
						</div>
					</div>

					<div class="col-md-3">
						<div class="form-group">
							<label>Consultancy Name </label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="text" id="con_consultancy" name="con_consultancy"
									value="<%=con.getCon_consultancyname()%>"
									value="<%=con.getCon_consultancyname()%>"
									placeholder="Enter Organization name.." class="form-control"
									required="true" readonly="readonly">
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
								<%
									Date Currrentdate = null;
									String c_Date = "";
									String E_Date = "";
									if (con.getCon_date() != "") {
										Currrentdate = ConnectionProvider.StringtoDateConvertion(con.getCon_date().toString().trim());
										SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
										c_Date = ft.format(Currrentdate);
									}
								%>

								<input type="date" id="con_date" name="con_date"
									value="<%=c_Date%>" class="form-control pull-right"
									id="datepicker" readonly="readonly">
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
									if (con.getCon_e_date() != "") {
										Currrentdate = ConnectionProvider.StringtoDateConvertion(con.getCon_e_date().toString().trim());
										SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
										E_Date = ft.format(Currrentdate);
									}
								%>

								<input type="date" id="edate" name="edate" value="<%=E_Date%>"
									class="form-control pull-right" id="datepicker"
									readonly="readonly">
							</div>
							<!-- /.input group -->
						</div>
					</div>
					<!--Expire Date End -->


					<!--Street Start-->


					<div class="col-md-3">
						<div class="form-group">
							<label>Street </label>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-street-view "></i></span> <input type="text"
									id="con_street" name="con_street"
									value="<%=con.getCon_street()%>" placeholder="Enter Street.."
									class="form-control" required="true" readonly="readonly">
							</div>
						</div>
					</div>

					<!--Street End-->

					<%
						try {
							ConnectionProvider.ps = ConnectionProviderSingleTone.getInstance()
									.prepareStatement("select city_name from city");
							ConnectionProvider.rs = ConnectionProvider.ps.executeQuery();
					%>

					<div class="col-md-3">
						<div class="form-group">
							<label>City</label>
							<!-- <a href="#" data-toggle="modal"
								data-target="#myModal"><span style="color: red;"><i
									class="fa fa-plus"></i> City</span></a> -->
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-home"></i></span>
								<select class="form-control select2 select2-hidden-accessible"
									id="con_city" value="<%=con.getCon_city()%>" name="con_city"
									style="width: 100%;" tabindex="-1" aria-hidden="true"
									readonly="readonly">
									<option>--Select--</option>
									<%
										while (ConnectionProvider.rs.next()) {
												if (ConnectionProvider.rs.getString(1).toString().equalsIgnoreCase(con.getCon_city())) {
									%>

									<option selected="selected"><%=ConnectionProvider.rs.getString(1)%></option>


									<%
										} else {
									%>

									<option><%=ConnectionProvider.rs.getString(1)%></option>
									<%
										}
											}
									%>
								</select>
								<%
									} catch (Exception e) {
										out.println("wrong entry" + e);
										e.printStackTrace();
										ConnectionProvider.CloseAllGlobConnection();
									}
								%>
							</div>
						</div>
					</div>



					<%
						try {
							ConnectionProvider.ps = ConnectionProviderSingleTone.getInstance()
									.prepareStatement("select state_name from state");
							ConnectionProvider.rs = ConnectionProvider.ps.executeQuery();
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
									id="con_state" value="<%=con.getCon_state()%>"
									name="con_state" style="width: 100%;" tabindex="-1"
									aria-hidden="true" readonly="readonly">
									<option>--Select--</option>
									<%
										while (ConnectionProvider.rs.next()) {
												if (ConnectionProvider.rs.getString(1).toString().equalsIgnoreCase(con.getCon_state())) {
									%>
									<option selected="selected"><%=ConnectionProvider.rs.getString(1)%></option>
									<%
										} else {
									%>
									<option><%=ConnectionProvider.rs.getString(1)%></option>
									<%
												}
										}
									%>
								</select>
								<%
									} catch (Exception e) {
										out.println("wrong entry" + e);
										e.printStackTrace();
										ConnectionProvider.CloseAllGlobConnection();
									}finally{
										ConnectionProvider.CloseAllGlobConnection();
									}
								%>
							</div>
						</div>
					</div>



					<%
						try {
							ConnectionProvider.ps = ConnectionProviderSingleTone.getInstance()
									.prepareStatement("select country_name from country");
							ConnectionProvider.rs = ConnectionProvider.ps.executeQuery();
					%>

					<div class="col-md-3">
						<div class="form-group">
							<label>Country</label>
							<!-- <a href="#" data-toggle="modal"
								data-target="#myModal1"><span style="color: red;"><i
									class="fa fa-plus"></i> Country</span></a> -->
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-flag"></i></span>
								<select class="form-control select2 select2-hidden-accessible"
									id="con_country" name="con_country"
									value="<%=con.getCon_country()%>" style="width: 100%;"
									tabindex="-1" aria-hidden="true" readonly="readonly">
									<option>--Select--</option>
									<!-- code for retrive  dropdown -->
									<%
										while (ConnectionProvider.rs.next()) {
												if (ConnectionProvider.rs.getString(1).toString().equalsIgnoreCase(con.getCon_country())) {
									%>
									<option selected="selected"><%=ConnectionProvider.rs.getString(1)%></option>
									<%
										} else {
									%>

									<option><%=ConnectionProvider.rs.getString(1)%></option>
									<%
										}
											}
									%>
								</select>
								<%
									} catch (Exception e) {
										out.println("wrong entry" + e);
										e.printStackTrace();
									}finally{
										ConnectionProvider.CloseAllGlobConnection();
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
									placeholder="Enter Zipcode.."
									value="<%=con.getCon_zipcode()%>" class="form-control"
									required="true" readonly="readonly">
							</div>
						</div>
					</div>


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
