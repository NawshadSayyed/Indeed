<aside class="main-sidebar" style="height: 950px;">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel" align="center">

			<p style="color: white;"><%= session.getAttribute("Uname") %></p>

			<a href="#"><i class="fa fa-circle text-success"></i><label>Online</label></a>
		</div>


		<ul class="sidebar-menu tree" data-widget="tree">

		<!-- active -->	<li class="menu-open"><a href="./index.jsp"> <i
					class="fa fa-dashboard"></i> <span>Dashboard</span>
			</a></li>

			<!-- used for Accounts Creation and Manupulations  -->
			<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
					<span>Account</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="ConsultancyProfile.jsp"><i
							class="fa fa-circle-o"></i> Profile</a></li>
					<li><a href="./UpdatePassword.jsp"><i
							class="fa fa-circle-o"></i> Change Password</a></li>

				</ul></li>
			<!-- used for Accounts Creation and Manupulations  -->





			<!-- Used for Consultant -->
			<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
					<span>Consulant</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="ViewAllJobs.jsp"><i class="fa fa-circle-o"></i>
							View Posted Jobs </a></li>
					<!-- <li><a href="View_Applied_Candidate.jsp"><i class="fa fa-circle-o"></i>
							View Applied Candidate</a></li>		 -->
							
					<li><a href="Edit_App_Candidate_Deatils.jsp"><i
							class="fa fa-circle-o"></i> Edit Scheduled Job</a></li>
					<li><a href="ViewAllScheduledCandidate.jsp"><i
							class="fa fa-circle-o"></i> Scheduled Candidate Report </a></li>


					<li><a href="ViewCandidateInterviewResult.jsp"><i
							class="fa fa-circle-o"></i> Interview Feedback</a></li>
							<li><a href="RejectedCandidate.jsp"><i
							class="fa fa-circle-o"></i> Rejected Candidate </a></li>
				</ul></li>
			<!-- Used for Job Consultant -->



			<!-- <li class=""><a href="#"> <i class="fa fa-gear"></i> <span>Settings</span>
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