<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Interview Feedback | Jobber</title>
</head>
<body>
	<%@include file="./aheader.jsp"%>
	<%@include file="./alside.jsp"%>
	<%@include file="./arside.jsp"%>

	<%
int sched_id = 0;
int candidate_id =0;
int consultant_id =0;
String can_name ="";
String can_job_Categories ="";
String can_job_title ="";
String hdn_Interview_Date ="";
if(request.getParameter("Edit_id")!=null)
{
 sched_id = Integer.parseInt(request.getParameter("Edit_id").toString().trim()) ;
 candidate_id = Integer.parseInt(request.getParameter("candidate_id").toString().trim());
 can_name =request.getParameter("hdn_CandidateName").toString().trim();
 can_job_Categories =request.getParameter("hdn_job_category").toString().trim();
 can_job_title =request.getParameter("hdn_job_title").toString().trim();
 hdn_Interview_Date =request.getParameter("hdn_Interview_Date").toString().trim();
 System.out.print("sched_id"+sched_id+""+"candidate_id"+candidate_id+"consultant_id"+consultant_id);
}
%>


	<div class="content-wrapper">
		<div class="row">

			<form action="./FeedbackController" method="post">

				<div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 col-xl-12">
					<div class="col-md-12 col-xs-12 col-lg-12 col-sm-12">
						<div class="box box-info">
							<div class="box-header">
								<h2>Interview Feedback Form</h2>
							</div>
							<div class="box-body">
								<input type="hidden" id="hdn_candidate_id"
									name="hdn_candidate_id" value="<%=candidate_id %>">
								 <input	type="hidden" id="hdn_schedule_id" name="hdn_schedule_id"
									value="<%=sched_id %>">
									 <input type="text" id="hdn_feedback_id" name="hdn_feedback_id" value="<%=consultant_id %>">
									 <input type="text" id="hdn_consultant_id" name="hdn_consultant_id" value="<%=consultant_id %>">

								<div class="col-md-3">
									<%-- value="<%=cmod.getUname() %>" --%>
									<div class="form-group">
										<label>Candidate Name </label>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i></span>
											<input type="text" id="txt_Candidate_Name "
												name="txt_Candidate_Name" placeholder="Enter Candidate Name"
												value="<%=can_name %>" class="form-control" required="true"
												readonly="readonly">
										</div>
									</div>
								</div>



								<div class="col-md-3">
									<%-- value="<%=cmod.getUname() %>" --%>
									<div class="form-group">
										<label>Int. Schedule Date </label>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i></span>
											<input type="text" id="txt_intSchedules_date" name="uname"
												placeholder="Enter Schedules Date" class="form-control"
												required="true" readonly="readonly"
												value="<%= hdn_Interview_Date %>">
										</div>
									</div>
								</div>






								<div class="col-md-3">
									<%-- value="<%=cmod.getUname() %>" --%>
									<div class="form-group">
										<label>Job Categories</label>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i></span>
											<input type="text" id="txt_job_categories"
												name="txt_job_categories" placeholder="Enter Job Categories"
												class="form-control" required="true"
												value="<%=can_job_Categories %>" readonly="readonly">
										</div>
									</div>
								</div>


								<div class="col-md-3">
									<%-- value="<%=cmod.getUname() %>" --%>
									<div class="form-group">
										<label>Job Title</label>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i></span>
											<input type="text" id="txt_job_Title" name="txt_job_Title"
												placeholder="Enter Job Title" class="form-control"
												required="true" value="<%=can_job_title %>"
												readonly="readonly">
										</div>
									</div>
								</div>


								<div class="col-md-3">
									<%-- value="<%=cmod.getUname() %>" --%>
									<div class="form-group">
										<label>Technical Knowledge</label>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i></span>
											<input type="text" id="txt_Tech_Know" name="txt_Tech_Know"
												placeholder="Enter Technical Knowwladge "
												class="form-control" required="true"
													alt="Enter Technical Knowwladge" title="Enter Technical Knowledge"
												required="required"
												oninvalid="setCustomValidity('Please Enter Technical Knowledge ')"
												onchange="try{setCustomValidity('')}catch(e){}"
							>
										</div>
									</div>
								</div>


								<div class="col-md-3">
									<%-- value="<%=cmod.getUname() %>" --%>
									<div class="form-group">
										<label>Practical Knowledge</label>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i></span>
											<input type="text" id="txt_Prac_Know" name="txt_Prac_Know"
												placeholder="Enter Practical Knowlede" class="form-control"
												alt="Enter Practical Knowwladge" title="Enter Practical Knowledge"
												required="required"
												oninvalid="setCustomValidity('Please Enter Practical Knowledge ')"
												onchange="try{setCustomValidity('')}catch(e){}">
										</div>
									</div>
								</div>


								<div class="col-md-3">
									<%-- value="<%=cmod.getUname() %>" --%>
									<div class="form-group">
										<label>Communication Skill</label>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i></span>
											<input type="text" id="txt_Comm_Skill" name="txt_Comm_Skill"
												placeholder="Enter Communication Skill" class="form-control"
												alt="Enter Communication Skill" title="Enter Communication Skill"
												required="required"
												oninvalid="setCustomValidity('Please Enter Communication Skill')"
												onchange="try{setCustomValidity('')}catch(e){}">
										</div>
									</div>
								</div>



								<div class="col-md-3">
									<%-- value="<%=cmod.getUname() %>" --%>
									<div class="form-group">
										<label>Body Language</label>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i></span>
											<input type="text" id="txt_Body_Lang" name="txt_Body_Lang"
												placeholder="Enter Body Language" class="form-control"
												required="true"
												alt="Enter Body Language" title="Enter Body Language"
												required="required"
												oninvalid="setCustomValidity('Please Enter Body Language')"
												onchange="try{setCustomValidity('')}catch(e){}"
												>
										</div>
									</div>
								</div>


								<div class="col-md-12">
									<%-- value="<%=cmod.getUname() %>" --%>
									<div class="form-group">
										<label>Remark</label>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa fa-user"></i></span>
											<textarea rows="2" id="txt_Remark" name="txt_Remark"
												placeholder="Enter Remark" class="form-control"
												title="Enter Remark" required="required"
												oninvalid="setCustomValidity('Please Enter Remark')"
												onchange="try{setCustomValidity('')}catch(e){}"></textarea>
										</div>
									</div>
								</div>


							</div>
							<div class="box-footer">
								<button type="submit" id="btn_PostJob" name="btn_Submit"
									class="btn btn-success " value="Save" alt="Submit Form"
									title="Submit Form">
									<i class="fa fa-save"></i> Save
								</button>
								<button type="reset" id="btn_PostJob" name="btn_Submit"
									class="btn btn-warning " value="Reset" alt="Reset Form"
									title="Reset Form">
									<i class="fa fa-refresh"></i> Refresh
								</button>


							</div>
						</div>
					</div>

				</div>

			</form>
		</div>
	</div>


	<%@include file="./afooter.jsp"%>





</body>
</html>