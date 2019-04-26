<aside class="main-sidebar" style="height: 950px;">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel" align="center">

			<p style="color: white;"><%= session.getAttribute("Uname") %></p>

			<a href="#"><i class="fa fa-circle text-success"></i><label>Online</label></a>
		</div>


		<ul class="sidebar-menu tree" data-widget="tree">

	<!-- active -->		<li class="  menu-open"><a href="./index.jsp"> <i
					class="fa fa-dashboard"></i> <span>Dashboard</span>
			</a></li>

			<!-- used for Accounts Creation and Manupulations  -->
			<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
					<span>Profile</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="./UpdatePassword.jsp"><i
							class="fa fa-circle-o"></i> Update Password</a></li>
					<!-- <li><a href="Company.jsp"><i class="fa fa-circle-o"></i>
							Employer</a></li> -->
					<!-- <li><a href="Consultancy.jsp"><i class="fa fa-circle-o"></i>
							Consultant</a></li> -->

					<!-- <li><a href="CosultancyReport.jsp"><i
							class="fa fa-circle-o"></i>Edit Consultant Report</a></li>		 -->

				</ul></li>
			<!-- used for Accounts Creation and Manupulations  -->

			<!-- used for Job posting  -->
			<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
					<span>Employer</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="PostJob.jsp"><i class="fa fa-circle-o"></i>
							Post New job </a></li>
					<li><a href="ViewPostJob.jsp"><i class="fa fa-circle-o"></i>
							Edit Posted Jobs</a></li>

					<li><a href="View_Applied_Candidate.jsp"><i
							class="fa fa-circle-o"></i> Applied Candidate </a></li>
							<li><a href="RejectedCandidate.jsp"><i
							class="fa fa-circle-o"></i> Rejected Candidate </a></li>
					<li><a href="ViewSchedulesInterview.jsp"><i
							class="fa fa-circle-o"></i> Feedback </a></li>


				</ul></li>
			<!-- used for Job posting  -->



			<!-- Used for Consultant - ->
			<li class="treeview">
			<a href="#"> <i class="fa fa-edit"></i>
					<span>Consulant</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li>
					<a href="ViewAllJobs.jsp"><i class="fa fa-circle-o"></i>
							View Posted Jobs </a>
					</li>
					<li>
					<a href="Edit_App_Candidate_Deatils.jsp"><i class="fa fa-circle-o"></i>
							Edit Scheduled Job</a>
					</li>
					<li>
					<a href="ViewAllScheduledCandidate.jsp"><i class="fa fa-circle-o"></i>
							Scheduled Candidate Report  </a>
					</li>
					
					
					<li>
					<a href="ViewCandidateInterviewResult.jsp"><i class="fa fa-circle-o"></i>
							Interview Feedback</a>
					</li>
			</ul>
			</li>
			<!- - Used for Job Consultant - ->	
			

			<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
					<span>Reports</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="CompanyReport.jsp"><i class="fa fa-circle-o"></i>
							Employer Report</a></li>
					<li><a href="CosultancyReport.jsp"><i
							class="fa fa-circle-o"></i> Consultant Report</a></li>
				</ul></li>
			<!- - <li class=""><a href="#"> <i class="fa fa-gear"></i> <span>Settings</span>
			</a></li> -->
<li ><a href="./ComposeMail.jsp"> <i
					class="fa fa-dashboard"></i> <span>Email</span>
			</a></li>	
			<li class=""><a href="./logout.jsp"> <i
					class="fa fa-power-off"></i> <span>Logout</span>
			</a></li>

		</ul>

	</section>
	<!-- /.sidebar -->
</aside>