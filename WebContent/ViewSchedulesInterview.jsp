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
<title>Interview Schedules Details | Jobber</title>
</head>
<body>
	<%@ include file="./aheader.jsp"%>
	<%@ include file="./alside.jsp"%>
	<%@ include file="./arside.jsp"%>

	<div class="content-wrapper" style="background-color: white;">

		<div class="box-header" align="center">
			<div class="alert alert-warning alert-dismissible">
				<h2 class="box-title">
					<u><b> <a href="">Interview Schedules Details </a>
					</b></u>
				</h2>
			</div>
		</div>

		<div class="row">

			<div class="col-md-12 col-sm-12 col-lg-12 col-xl-12 col-xs-12">


				<div class="col-md-12 col-xs-12 col-lg-12 col-sm-12">
					<div class="box box-info">
						<div class="box-header">



							<div class="row">
								<form action="./SchedulesInterviewController">
									<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
										<div class="form-group">
										<label>Select By</label>
											<div class="input-group">

												<span class="input-group-addon"> <i
													class="fa fa-search"></i></span> <select id="txt_search_by"
													name="txt_search_by" class="form-control" required="required">

													<option value='First Name'>First Name</option>
													<option value='Middle Name'>Middle Name</option>
													<option value='Last Name'>Last Name</option>
													<option value='Email'>Email</option>
													<option value='Candidate Phone'>Candidate Phone</option>
													<option value='Location'>Location</option>
													<option value='Interview Name'>Interview Name</option>
													<option value='Contact Person Name'>Contact Person
														Name</option>
													<option value='Company Name'>Company Name</option>
													<option value='By Job Type'>By Job Type</option>
													<option value='Job Categories'>Job Categories</option>
												</select>


											</div>
										</div>
									</div>

									<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
										<lable>Search Value</lable>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="fa fa-search"></i></span> <input type="text"
													id="txt_search_value" name="txt_search_value"
													placeholder="Search" class="form-control"
													required="required">
											</div>
										</div>
									</div>
									<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
										<label>&nbsp;</label>
										<div class="form-group">
											<button type="submit" name="btn_Submit" value="Search"
												class="btn btn-info btn-md">Search</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="box-body">
							<div class="row">
								<div class="col-md-12 col-xs-12 col-sm-12 col-lg-12">
									<table class="table table-responsive">
										<thead>
											<tr>
												<th>Sr No</th>
												<th>Cand. Name</th>
												<th>Cand. Email</th>
												<th>Cand. Phone</th>
												<th>Contact Person</th>
												<th>Contact No.</th>
												<th>Int.Date</th>
												<th>Int.Time</th>
												<th>Int.Name</th>
												<th>Job Categories</th>
												<th>Job Title</th>
												<th>Int.Address</th>
												<th>Company Name</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<%
												SchedulesInterviewInf sii = null;
												StringBuilder sb =new StringBuilder();
												
												try {
													if (request.getParameter("search_by") != null) {
														sii = new SchedulesImplements();
														String serch = request.getParameter("search_by").toString().trim();
														String servh_value = request.getParameter("search_value").toString().trim();
														sb.append(sii.ViewAllQuery(serch, servh_value));
														
													} else {
														sii = new SchedulesImplements();
														sb= new StringBuilder();
														sb.append(sii.ViewScheduledInterView());
													}
												}catch(Exception ex){
													ex.printStackTrace();
													}
												
													/* int a = 1;
													for (SchedulesInterModel sim : Details) { */
											%>
											
											<label><%=sb %></label>
										</tbody>
									</table>
								</div>
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