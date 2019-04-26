<%@page import="com.Interview.Schedulespkg.feedback.FeedbackInfImpl"%>
<%@page import="com.Interview.Schedulespkg.feedback.FeedbackInf"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate Interview Result | Jobber</title>
</head>
<body>
	<%@include file="./aheader.jsp"%>
	<%@include file="./alside.jsp"%>
	<%@include file="./arside.jsp"%>
	<div class="content-wrapper">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-lg-12 col-sx-12">
				<div class="col-md-12 col-sm-12 col-lg-12 col-sx-12">
					<div class="box box-info">
						<div class="box-header">
							<h3>Candidate Interview Result</h3>
						</div>
						<div class="box-body">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-lg-12 col-sx-12">
									<div class="row">
										<form action="./ViewCandidateInterviewResult.jsp"
											method="post">
											<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
												<div class="form-group">
													<label>Select By</label>
													<div class="input-group">

														<span class="input-group-addon"> <i
															class="fa fa-search"></i></span> <select id="txt_search_by"
															name="txt_search_by" class="form-control"
															required="required">
															<option value='Name'>First Name</option>
															<option value='Email'>Email</option>
															<option value='Candidate Phone'>Candidate Phone</option>
															<option value='Interview Name'>Interview Name</option>
														</select>


													</div>
												</div>
											</div>

											<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
												<label>Search Value</label>
												<div class="form-group">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="fa fa-search"></i></span> <input type="text"
															id="txt_search_value" name="txt_search_value"
															placeholder="Search" class="form-control"
															required="required"
															oninvalid="setCustomValidity('Please Enter Information like Search By First Name ,  Email, Phone Number, Interview Name')"
															onchange="try{setCustomValidity('')}catch(e){}">
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
							</div>

							<%
								FeedbackInf fi = new FeedbackInfImpl();
								StringBuilder sb = null;
								if (request.getParameter("txt_search_value") != null) {
									sb = new StringBuilder();
									sb = fi.ViewAllQuery(request.getParameter("txt_search_by").toString().trim(),
											request.getParameter("txt_search_value").toString().trim());
							%>


							<div class="row">
								<div class="col-md-12 col-sm-12 col-lg-12 col-sx-12">
									<table class="table table-responsive">
										<thead>
											<tr>
												<th>Sr No.</th>
												<th>Candidate Name</th>
												<th>Email id</th>
												<th>Phone</th>
												<th>Interview</th>
												<th>Technical</th>
												<th>Practical</th>
												<th>Comm. Skill</th>
												<th>Body Language</th>
												<th>Remark</th>
											</tr>
										</thead>


										<label><%=sb%></label>



									</table>
								</div>
							</div>
							<%
								} else {
							%>
							<div class="row">
								<img alt="Search Image" src="./dist/img/Search.jpg"
									style="width: 40%;">

							</div>
							<%
								}
							%>

						</div>
						
					</div>

				</div>

			</div>


		</div>


	</div>



	<%@include file="./afooter.jsp"%>




</body>
</html>