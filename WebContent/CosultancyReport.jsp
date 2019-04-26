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
            if ( (charCode < 65 || charCode > 90)  && (charCode < 97 || charCode > 122   )){
                return false;
            }
          return true;
        }
    </script>
<div class="content-wrapper" style="background-color: white;">

	<div class="box">
		<div class="box-header" align="center">
			<div class="callout callout-warning">
				<h3 class="box-title">
					<b><u>CONSULTANT REPORTS </u></b>
				</h3>
			</div>
		</div>
		<!-- /.box-header -->
		<div class="box-body">

			<div class="row">
				<form action="./CosultancyReport.jsp">
					<div class="col-sm-3 col-md-3 col-lg-3 col-xs-3 col-xl-3">




						<div class="search-container">

							<input type="text" placeholder="Search by User Name."
								name="Search" class="form-control" alt="Search by User Name."
								title="Search by User Name." required="required"
								oninvalid="setCustomValidity('Please Enter User Name')"
								onchange="try{setCustomValidity('')}catch(e){}">

						</div>
					</div>
					<div class="col-sm-3 col-md-3 col-lg-3 col-xs-3 col-xl-3">
						<button type="submit"
							class="btn btn-primary btn-social-icon btn-flickr">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>

			</div>

			<div id="example1_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap">


				<div class="scrollmenu" style="height: 470px;">



					<div class="row">
						<div class="col-sm-12">
							<br />
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
											style="width: 4px;"><font color="white">DATE</font></th>
										<th class="sorting tableheading" rowspan="1" colspan="1"
											style="width: 4px;"><font color="white">Valid
												Till</font></th>
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
									<%-- 				<%
              try{
            	  PreparedStatement ps=null;
            	  ResultSet rs=null;
            	  
            	  
                       String  qQuery =" select id, c.uname , c.upass,CONCAT(c.fname,' ', c.lname) AS NAME, mnumber, lnumber, email, consultancyname, c_date,e_date, street, city, state, country, zipcode FROM consultancydetails  c where uname like ' "+se +"'";        	
            	  ConnectionProvider.con=ConnectionProvider.getConnection();
            	  ConnectionProvider.ps=ConnectionProvider.con.prepareStatement(qQuery);
                  ConnectionProvider.rs=ConnectionProvider.ps.executeQuery();
            	  while(ConnectionProvider.rs.next())
            	  {
            		  %> --%>


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

											String qQuery = "select id, c.uname , c.upass,CONCAT(c.fname,' ', c.lname) AS NAME, mnumber, lnumber, email, consultancyname, c_date,e_date, street, city, state, country, zipcode FROM consultancydetails c WHERE uname LIKE '%"
													+ Serch + "%'";
											ConnectionProvider.ps = ConnectionProviderSingleTone.getInstance().prepareStatement(qQuery);
											ConnectionProvider.rs = ConnectionProvider.ps.executeQuery();
											while (ConnectionProvider.rs.next()) {
									%>
									<form action="./ConsultancyController">
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
													class="btn btn-info btn-xs" name="btn_submit" value="View">View</button></td>
											<td><button type="submit" class="btn btn-primary btn-xs"
													name="btn_submit" value="Edit">Edit</button></td>
											<td><button type="submit" class="btn btn-danger btn-xs"
													name="btn_submit" value="Delete">Delete</button></td>
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