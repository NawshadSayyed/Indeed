<%@page import="com.Consultancy.CandidateDetails.CandidateDetailsInf"%>
<%@page import="com.Consultancy.CandidateDetails.CandidateDetailsImpl"%>
<%@page import="com.Consultancy.CandidateDetails.CandidateDetailsModel"%>
<%@page import="com.Company.jobPost.JobPostModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Company.jobPost.JobPostableImplement"%>
<%@page import="com.Company.jobPost.JobPostable"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rejected Candidate Details | Jobber</title>

<link rel="icon" type="image/png" sizes="32x32" href="./dist/favicon/favicon1.ico">
<link rel="icon" type="image/png" sizes="96x96" href="./dist/favicon/favicon1.ico">
<link rel="icon" type="image/png" sizes="16x16" href="./dist/favicon/favicon1.ico">
<!-- <script>
function myFunction() {
  confirm("Do you Really Wants To Reject Him/Her ?");
}
</script> -->
</head>
<body>


	<%@ include file="./aheader.jsp"%>
	<%@ include file="./alside.jsp"%>
	<%@ include file="./arside.jsp"%>


	<div class="content-wrapper" style="background-color: white;">

		<div class="box-header" align="center">
			<div class="alert alert-warning alert-dismissible">
				<h2 class="box-title">
					<u><b> <a href="">Rejected Candidate Details </a>
					</b></u>
				</h2>
			</div>
		</div>




		<div class="col-md-12">
			<div class="box box-danger">


				<div class="box-body">

					<div class="row">
						<form action="./RejectedCandidate.jsp">

							<div class="col-md-3 col-sm-3 col-lg-3 col-xs-3">
								<div class="box-title">
									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="fa fa-search"></i></span> <input type="text" id="txt_search"
												name="txt_search" placeholder="Search." class="form-control"
												alt="Please Enter Information like Search By First Name , Middle Name , Last Name , Email , Phone , location "
												title="Please Enter Information like Search By First Name , Middle Name , Last Name Email , Phone , location"
												required="required"
												oninvalid="setCustomValidity('Please Enter Information like Search By First Name , Middle Name , Last Name Email , Phone , location')"
												onchange="try{setCustomValidity('')}catch(e){}"
							>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-3 col-sm-3 col-lg-3 col-xs-3">
								<div class="box-title">
									<div class="form-group">
										<div class="input-group">
											<input type="submit" id="btn_search" name="btn_search"
												class="btn btn-info"
												alt=" Search By First Name , Middle Name , Last Name , Email , Phone , location "
												title="Search By First Name , Middle Name , Last Name Email , Phone , location"
												value="Search">
										</div>
									</div>
								</div>
							</div>

						</form>
					</div>

					<div class="row">
						<div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
							<table class="table table-responsive">
							


									<%
									CandidateDetailsInf cdm = null;
										ArrayList<CandidateDetailsModel> Details = null;
										try {

											if (request.getParameter("txt_search") != null) {
												cdm = new CandidateDetailsImpl();
												String serch = request.getParameter("txt_search").toString().trim();
												Details = cdm.ViewAllJobDetilsRejectedCandidate(am,serch);
											} else {
												cdm = new CandidateDetailsImpl();
												Details = cdm.ViewAllJobDetilsRejectedCandidate(am);
											}
											 if (am.getUserType().equalsIgnoreCase("Consultant")) { %>
										    <script type="text/javascript">
										    demoFunction();
										    </script>
										<% } %>
										
											<thead>
									<tr>
										<th>Sr</th>
										<th>Date</th>
										<th>Name</th>
										<th>Email</th>
										<th>phone</th>
										<th>Experience</th>
										<th>Skill</th>
										<th>Location</th>
										<th>Resume</th>
										<!-- <th>Action</th> -->
									</tr>
								</thead>
										<% 	int a = 1;
											for (CandidateDetailsModel al : Details) {
									
									%>
									
									
								<tbody>
									
									<form action="./SchedulesInterviewController" method="post">
										<tr>
											<td><%=a%><input type="hidden"
												name="Applied_Candidate_id" id="Applied_Candidate_id"
												value="<%=al.getCandidate_id()%>" /> <input type="hidden"
												name="Applied_Candidate_Job_id"
												id="Applied_Candidate_Job_id"
												value="<%=al.getjob_app_id()%>" /></td>

											<td><%=al.getApp_date()%></td>
											<td><%=al.getCand_first_name() +" " + al.getCand_mid_name() +" " +al.getCand_last_name()  %></td>
											<td><%=al.getCand_email()%></td>
											<td><%=al.getCand_phone()%></td>
											<td><%=al.getCand_exp_year() +"-Year "+ al.getCand_exp_month() +"-Month" %></td>
											<td><%=al.getCand_skils()%></td>
											<td><%=al.getlocation()%></td>
											<td><%="<a href='./CandidateResume?Candidate_id="+al.getCandidate_id()+"' alt='Click To Download Resume' title='Click To Download Resume'>"+"<i class='fa fa-file-word-o fa-2x'></i>"+"</a>" %></td>
											<!-- <td class="thaction">
												<button type="submit" id="btn_Submit" name="btn_Submit"
													class="btn btn-warning btn-sm" value="Schedule_Interview"
													alt="Schedule Interview" title="Schedule Interview">
													<i class="fa fa fa-calendar-plus-o "></i>
												</button>

												<button type="submit" id="btn_Submit" name="btn_Submit"
													class="btn btn-danger btn-sm" value="Reject_Candidate"
													alt="Reject Candidate" title="Reject Candidate"
													onclick="return confirm('Do you want to Reject Candidate ?');">
													<i class="fa fa-times "></i>
												</button>
											</td> -->
										</tr>
									</form>

									<%
										a = ++a;
											}
										} catch (Exception ex) {
											ex.printStackTrace();
										} finally {
											if (cdm != null) {
												cdm = null;
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






	<%@ include file="./afooter.jsp"%>
</body>
</html>