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
<title>Posted Job Details | Jobber</title>
</head>
<body>


	<%@ include file="./aheader.jsp"%>
	<%@ include file="./alside.jsp"%>
	<%@ include file="./arside.jsp"%>


	<div class="content-wrapper" style="background-color: white;">

		<div class="box-header" align="center">
			<div class="alert alert-warning alert-dismissible">
				<h2 class="box-title">
					<u><b> <a href="">Posted Job Details </a>
					</b></u>
				</h2>
			</div>
		</div>




		<div class="col-md-12">
			<div class="box box-danger">


				<div class="box-body">

					<div class="row">
						<form action="./ViewPostJob.jsp">

							<div class="col-md-3 col-sm-3 col-lg-3 col-xs-3">
								<div class="box-title">
									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="fa fa-search"></i></span> <input type="text" id="txt_search"
												name="txt_search" placeholder="Search." class="form-control"
												alt="Please Enter Information like Search By Job Category, Location , Job Type , Categories or Post Status"
												title="Please Enter Information like Search By Job Category, Location , Job Type , Categories or Post Status"
												required="required"
												oninvalid="setCustomValidity('Please Enter Information like Search By Job Category, Location , Job Type , Categories or Post Status')"
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
												class="btn btn-info" value="Search">
										</div>
									</div>
								</div>
							</div>

						</form>
					</div>


					<div class="row">
						<div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
							<table class="table table-responsive">
								<thead>
									<tr>
										<th>Sr</th>
										<th>Post Date</th>
										<th>Company</th>
										<th>Title</th>
										<th>Vacancies</th>
										<th>Category</th>
										<th>Salary</th>
										<th>Location</th>
										<th>Job Type</th>
										<th>Post Status</th>
										<th>Apply</th>
									</tr>
								</thead>
								<tbody>


									<%
										JobPostable jp = null;
										ArrayList<JobPostModel> Details = null;
										try {

											if (request.getParameter("txt_search") != null) {
												jp = new JobPostableImplement();
												String serch = request.getParameter("txt_search").toString().trim();
												Details = jp.ViewAllJobDetils(am,serch);
											} else {
												jp = new JobPostableImplement();
												Details = jp.ViewAllJobDetils(am);
											}
											int a = 1;
											for (JobPostModel al : Details) {
									%>
									<form action="./JobPostController">
										<tr>
											<td><%=a%><input type="hidden" name="Edit_id"
												id="Edit_id" value="<%=al.getTxt_job_id()%>" /></td>
											<td><%=al.getTxt_job_post_date()%></td>
											<td><%=al.getTxt_Company_Name()%></td>
											<td><%=al.getTxt_job_Title()%></td>
											<td><%=al.getTxt_txt_No_vacancies()%></td>
											<td><%=al.getDdl_job_category()%></td>
											<td><%=al.getTxt_Sal_From()%> - <%=al.getTxt_Sal_To()%>
												<%=al.getDdl_Salary_Type()%></td>
											<td><%=al.getTxt_job_location()%></td>
											<td><%=al.getDdl_Job_Type()%></td>
											<td><%=al.getDdl_Post_Status()%></td>
											<td>
												<button type="submit" id="btn_PostJob" name="btn_PostJob"
													class="btn btn-warning btn-sm" value="Apply">
													<i class="fa fa-hand-o-right"></i>
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
											if (jp != null) {
												jp = null;
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