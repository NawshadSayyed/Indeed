<%@page import="com.ConProvider.ConnectionProviderSingleTone"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.ConProvider.ConnectionProvider"%>
<%@ include file="./aheader.jsp"%>
<%@ include file="./alside.jsp"%>
<%@ include file="./arside.jsp"%>
<style>
table, th, td {
	border: 1px solid black;
}

div.scrollmenu {
	background-color: white;
	overflow: auto;
	white-space: nowrap;
}

div.scrollmenu a {
	display: inline-block;
	color: white;
	text-align: center;
	padding: 14px;
	text-decoration: none;
}

div.scrollmenu a:hover {
	background-color: white;
}

.tableheading {
	background-color: #3c8dbc;
}
</style>



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
            if ( (charCode < 65 || charCode > 90)  && (charCode < 97 || charCode > 122   )  )
                return false;
           
             
          return true;
           
        }
    </script>
<div class="content-wrapper" style="background-color: white;">

	<div class="box">
		<div class="box-header" align="center">
			<div class="callout callout-warning">
				<h3 class="box-title">
					<b><u>EMPLOYER REPORTS </u></b>
				</h3>
			</div>
		</div>
		<!-- /.box-header -->
		<div class="box-body">
			<div id="example1_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap">
				<div class="row">
					<div class="col-sm-12 col-md-12 col-lg-12 col-xs-12">
						<div class="search-container">
							<form action="./CompanyReport.jsp" method="post">
								<input type="text" placeholder="Search By User Name."
									name="Search" class="form-control" required="required"
									alt="Search By User Name" title="Search By User Name"
									onkeypress="return isCharacterKey();"
									oninvalid="setCustomValidity('Please Enter User Name')"
									onchange="try{setCustomValidity('')}catch(e){}"> <span><button
										type="submit"
										class="btn btn-primary btn-social-icon btn-flickr">
										<i class="fa fa-search"></i>
									</button></span>
							</form>
						</div>
					</div>
				</div>

				<div class="scrollmenu" style="height: 470px;">
					<div class="row">

						<div>&nbsp;</div>
						<div class="col-sm-12">

							<table class="table">
								<thead>
									<tr role="row">
										<th class="sorting_asc tableheading" rowspan="1" colspan="1"
											style="width: 3px;"><font color="white">ID</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">USERNAME</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">PASSWORD</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">NAME</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">MOBILE
												NUMBER</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">WHATSAPP
												NUMBER</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">EMAIL ID</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">ORGANIZATION
												NAME</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">CREATE
												DATE</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">EXPIRE
												DATE</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">Address</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">CITY</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">STATE</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">COUNTRY</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">ZIPCODE</font></th>
										<th class="sorting" rowspan="1" colspan="1"
											style="width: 4px; background-color: #f39c12; display: none;"><font
											color="white">VIEW</font></th>
										<th class="sorting" rowspan="1" colspan="1"
											style="width: 4px; background-color: #f39c12;"><font
											color="white">EDIT</font></th>
										<th class="sorting" rowspan="1" colspan="1"
											style="width: 4px; background-color: #f39c12;"><font
											color="white">Delete</font></th>
									</tr>
								</thead>

								<tbody>
									<%
										try {

											String Serch = "";
											if (request.getParameter("Search") != null) {
												if (request.getParameter("Search") != "") {
													Serch = request.getParameter("Search").toString().trim();
												}
											}

											PreparedStatement ps = null;
											ResultSet rs = null;
											String qQuery = " select id, uname, upass,CONCAT(c.fname, '  ', c.lname) AS NAME, mnumber, wnumber, email, org_name, cdate, edate, street, city, state, country, zipcode FROM   companydetails c WHERE uname LIKE '%"
													+ Serch + "%'";
											ConnectionProvider.ps = ConnectionProviderSingleTone.getInstance().prepareStatement(qQuery);
											ConnectionProvider.rs = ConnectionProvider.ps.executeQuery();
											while (ConnectionProvider.rs.next()) {
									%>
									<form action="./CompanyController">
										<tr>
											<td><%=ConnectionProvider.rs.getInt(1)%> <input
												type="hidden" name="view_id"
												value="<%=ConnectionProvider.rs.getString(1)%>"></td>
											<td><%=ConnectionProvider.rs.getString(2)%></td>
											<td><%=ConnectionProvider.rs.getString(3)%></td>
											<td><%=ConnectionProvider.rs.getString(4)%></td>
											<td><%=ConnectionProvider.rs.getString(5)%></td>
											<td><%=ConnectionProvider.rs.getString(6)%></td>
											<td><%=ConnectionProvider.rs.getString(7)%></td>
											<td><%=ConnectionProvider.rs.getString(8)%></td>
											<td><%=ConnectionProvider.rs.getString(9)%></td>
											<td><%=ConnectionProvider.rs.getString(10)%></td>
											<td><%=ConnectionProvider.rs.getString(11)%></td>
											<td><%=ConnectionProvider.rs.getString(12)%></td>
											<td><%=ConnectionProvider.rs.getString(13)%></td>
											<td><%=ConnectionProvider.rs.getString(14)%></td>
											<td><%=ConnectionProvider.rs.getString(15)%></td>

											<td style="display: none;"><button type="submit"
													class="btn btn-info btn-xs" name="btn_submit" value="View">
													<i class="fa fa-eye"></i>View
												</button></td>
											<td><button type="submit" class="btn btn-primary btn-xs"
													name="btn_submit" value="Edit">
													<i class="fa fa-edit"></i>Edit
												</button></td>
											<td><button type="submit" class="btn btn-danger btn-xs"
													name="btn_submit" value="Delete">
													<i class="fa fa-trash"></i> Delete
												</button></td>
										</tr>
									</form>
									<%
										}
										} catch (Exception e) {
											e.printStackTrace();
										} finally {
											ConnectionProvider.CloseAllGlobConnection();

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
	<!-- /.box-body -->
</div>
</div>

<%@ include file="./afooter.jsp"%>