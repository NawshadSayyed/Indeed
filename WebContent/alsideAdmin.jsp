<aside class="main-sidebar" style="height: 950px;">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel" align="center">
			<p style="color: white;"><%= session.getAttribute("Uname") %></p>
			<a href="#"><i class="fa fa-circle text-success"></i><label>Online</label></a>
		</div>
		<ul class="sidebar-menu tree" data-widget="tree">
			<li class="menu-open"><a href="./index.jsp"> <i
					class="fa fa-dashboard"></i> <span>Dashboard</span>
			</a></li>

			<!-- used for Accounts Creation and Manupulations  -->
			<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
					<span>Create Account</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="Company.jsp"><i class="fa fa-circle-o"></i>
							Employer</a></li>
					<li><a href="Consultancy.jsp"><i class="fa fa-circle-o"></i>
							Consultant</a></li>
					<li><a href="CompanyReport.jsp"><i class="fa fa-circle-o"></i>
							Edit Employer Report</a></li>
					<li><a href="CosultancyReport.jsp"><i
							class="fa fa-circle-o"></i>Edit Consultant Report</a></li>

				</ul></li>


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

			<li><a href="./ComposeMail.jsp"> <i class="fa fa-dashboard"></i>
					<span>Email</span>
			</a></li>

			<!-- <li class=""><a href="#"> <i class="fa fa-gear"></i> <span>Settings</span>
			</a></li> -->

			<li><a href="./logout.jsp"> <i class="fa fa-power-off"></i>
					<span>Logout</span>
			</a></li>

		</ul>

	</section>
	<!-- /.sidebar -->
</aside>