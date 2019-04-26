<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.Company.CompanyImplements"%>
<%@page import="com.Company.Company"%>
<%@page import="com.ConProvider.ConnectionProvider"%>
<title>Employer Account |Jobber</title>
<%@ include file="./aheader.jsp"%>
<script type="text/javascript">
<!--

//-->
function ValidatePassword(){
	document.getElementById("pass_match").innerHTML="";
	if(document.getElementById("upass").value != document.getElementById("conform_upass").value)
{
	document.getElementById("pass_match").innerHTML="Not Match";
	document.getElementById("conform_upass").value="";
return false;	
}	
}



function copyaddress()
{
	var uname =document.getElementById("uname").value;
	document.getElementById("email").value = uname;
}
</script>
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
            if ( (charCode < 65 || charCode > 90)  && (charCode < 97 || charCode > 122   ))
            {
            	return false;
            }
             
          return true;
           
        }
    </script>
<%@ include file="./alside.jsp"%>
<%@ include file="./arside.jsp"%>


<div class="content-wrapper" style="background-color: white;">
<!-- scope ="page | request | session | application"" -->
<jsp:useBean id= "cmod" scope= "page" class= "com.Company.CompanyModel">  </jsp:useBean>

	<% 
String btn_submit="";
String icon_btnsubmit ="";
 if(request.getParameter("view_id")!=null){
	 String id = request.getParameter("view_id").toString().trim();
	 /* if(request.getParameter("view_id")!=""){ */
	Company cmp= new CompanyImplements();
	cmod  =  cmp.viewById(id);
	id =null;
	btn_submit="Update";
	icon_btnsubmit ="fa fa-save";
	/* } */
}else{
	btn_submit="Submit";
	icon_btnsubmit ="fa fa-edit";
	cmod.setUname("");
    cmod.setUpass("");
    cmod.setFname("");
    cmod.setLname("");
    cmod.setM_number("");
    cmod.setW_number("");
    cmod.setEmail("");
    cmod.setOrganization_name("");
    cmod.setC_date("");
    cmod.setE_date("");
    cmod.setStreet("");
    cmod.setCity("");
    cmod.setState("Maharashtra");
    cmod.setCountry("India");
    cmod.setZipcode("");
    
}

%>
	<div class="box-header" align="center">
		<div class="alert alert-warning alert-dismissible">
			<h2 class="box-title">
				<u><b> CREATE EMPLOYER ACCOUNT </b></u>
			</h2>
		</div>
	</div>
	<form action="./CompanyController" method="post">
		<div class="col-md-12">
			<div class="box box-danger">

				<div class="box-header">
					<div class="alert alert-info alert-dismissible">
						<h4 class="box-title">Employer Details</h4>
					</div>
				</div>
				<% String error =request.getParameter("errormsg");
            if(error !=null){
            	out.print(error);
            }
            
            %>
				<div class="box-body">

					<div class="col-md-3">
						<div class="form-group">
							<label>Username </label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="email" id="uname" name="uname" onblur="copyaddress();"
									value="<%=cmod.getUname() %>" placeholder="Enter User Name."
									class="form-control" required="required" alt="Enter User Name"
									title="Enter User Name"
									oninvalid="setCustomValidity('Plz Enter Valid User Name example:abc@gmail.com')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>


					<div class="col-md-3">
						<div class="form-group">
							<label>Create Password </label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="password" id="upass" 
									value="<%=cmod.getUpass() %>" placeholder="Enter Password."
									class="form-control" required="required"
									alt="Please Enter User Password wich is alphanumeric and one Special Symbol like abcd@123"
									title="Please Enter User Password wich is alphanumeric and one Special Symbol like abcd@123 "
									maxlength="8"
									oninvalid="setCustomValidity('Plz Enter Valid Password')"
									min="8" onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>


				<div class="col-md-3">
						<div class="form-group">
							<label>Confirm Password <span id="pass_match"
								style="color: red;"></span>
							</label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="password" id="conform_upass" name="upass"
									value="<%= cmod.getUpass() %>"
									placeholder="Enter Password.." class="form-control"
									required="required" onblur="ValidatePassword();"
									alt="Please Enter User Password wich is alphanumeric and one Special Symbol like abcd@123"
									title="Please Enter User Password wich is alphanumeric and one Special Symbol like abcd@123 "
									maxlength="8"
									oninvalid="setCustomValidity('Plz Enter Valid Password')"
									min="8" max="8" onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>


					<!-- First Name -->
					<div class="col-md-3">
						<div class="form-group">
							<label>First Name</label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="text" id="fname" name="fname"
									value="<%=cmod.getFname() %>"
									placeholder="Please Enter First Name" class="form-control"
									required="required" alt="Please Enter First Name"
									title="Please Enter First Name"
									onkeypress="return isCharacterKey(event);" maxlength="30"
									oninvalid="setCustomValidity('Plz Enter First Name')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>


					<!-- Last Name -->

					<div class="col-md-3">
						<div class="form-group">
							<label>Last Name </label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="text" id="lname" name="lname"
									value="<%=cmod.getLname() %>" placeholder="Enter Last Name."
									class="form-control" required="required"
									alt="Please Enter Last Name" title="Please Enter Last Name"
									onkeypress="return isCharacterKey(event);" maxlength="30"
									oninvalid="setCustomValidity('Please Enter Last Name')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>

					<!-- Mobile number -->

					<div class="col-md-3">
						<div class="form-group">
							<label>Mobile Number </label>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-phone"></i></span>
								<input type="text" id="mnumber" name="mnumber"
									value="<%=cmod.getM_number() %>"
									placeholder="Enter Mobile Number." class="form-control"
									required="required" alt="Enter Mobile Number"
									title="Enter Mobile Number"
									onkeypress="return isNumberKey(event);" maxlength="10"
									pattern="[0-9]{10}"
									oninvalid="setCustomValidity('Please Enter Mobile Number')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>


					<div class="col-md-3">
						<div class="form-group">
							<label>Whatsapp Number </label>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-whatsapp"></i></span>
								<input type="text" id="wnumber" name="wnumber"
									value="<%=cmod.getW_number() %>"
									placeholder="Enter Whatsapp Number." class="form-control"
									required="required" onkeypress="return isNumberKey(event);"
									maxlength="10" pattern="[0-9]{10}"
									oninvalid="setCustomValidity('Please Enter Whatsapp Number')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>



					<!-- Email Id -->
					<div class="col-md-3">
						<div class="form-group">
							<label>Email Id </label>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-envelope"></i></span> <input type="text"
									id="email" name="email" placeholder="Enter Email Id."
									value="<%=cmod.getEmail() %>" class="form-control"
									required="required"
									oninvalid="setCustomValidity('Please Enter Valid Email Id Example:abc@gmail.com')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>

					<div class="col-md-3">
						<div class="form-group">
							<label>Organization Name </label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i></span>
								<input type="text" id="org_name" name="org_name"
									value="<%=cmod.getOrganization_name() %>"
									placeholder="Enter Organization name.." class="form-control"
									required="required"
									oninvalid="setCustomValidity('Please Enter Organization Name')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>


					<!--Create Date Start -->
					<div class="col-md-3">
						<div class="form-group">
							<label>Create Date </label>

							<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>

								<%Date Currrentdate=null;String c_Date="";String E_Date=""; 
								if(cmod.getC_date()!=""){
								Currrentdate = ConnectionProvider.StringtoDateConvertion(cmod.getC_date().toString().trim());
								 SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
								 c_Date = ft.format(Currrentdate);
								}else{
									 DateFormat dateformate = new SimpleDateFormat("yyyy-MM-dd");	
									 Date d1 = new Date();
									 c_Date =  dateformate.format(d1);
									 
								} %>
								<input type="date" id="cdate" name="cdate" value="<%=c_Date %>"
									class="form-control pull-right" id="datepicker"
									oninvalid="setCustomValidity('Please Select  Date')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
							<!-- /.input group -->
						</div>
					</div>
					<!--create Date End -->




					<!--Expire Date Start -->
					<div class="col-md-3">
						<div class="form-group">
							<label>Expire Date </label>

							<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>

								<% 
								if(cmod.getE_date()!=""){
								Currrentdate = ConnectionProvider.StringtoDateConvertion(cmod.getE_date().toString().trim());
								 SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
								 E_Date = ft.format(Currrentdate);
								}else{
									Calendar c1 = Calendar.getInstance();
									   c1.add(Calendar.YEAR, 1);
									   c1.add(Calendar.DATE,-1);
									   E_Date = new SimpleDateFormat("yyyy-MM-dd").format(c1.getTime());
									  
								} %>

								<input type="date" id="edate" name="edate" value="<%=E_Date%>"
									class="form-control pull-right" id="datepicker"
									oninvalid="setCustomValidity('Please Select Date')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
							<!-- /.input group -->
						</div>
					</div>
					<!--Expire Date End -->




					<!--Street Start-->


					<div class="col-md-3">
						<div class="form-group">
							<label>Address </label>
							<!-- Street -->
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-street-view "></i></span> <input type="text" id="street"
									value="<%=cmod.getStreet() %>" name="street"
									placeholder="Enter Address" class="form-control"
									required="required"
									oninvalid="setCustomValidity('Please Enter Address')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>

					<!--Street End-->

					<%
            try
            {
                ConnectionProvider.rs=ConnectionProvider.SelectData("select city_name from city");
            %>

					<div class="col-md-3">
						<div class="form-group">
							<label>City</label>
							<!-- <a href="#" data-toggle="modal"
								data-target="#myModal"><span style="color: red;"><i
									class="fa fa-plus"></i> City</span></a> -->
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-home"></i></span>
								<select class="form-control select2 select2-hidden-accessible"
									id="city" name="city" style="width: 100%;" tabindex="-1"
									aria-hidden="true" required="required"
									oninvalid="setCustomValidity('Please Select City')"
									onchange="try{setCustomValidity('')}catch(e){}">
									<option value="">--Select--</option>
									<% while(ConnectionProvider.rs.next()){
										if(ConnectionProvider.rs.getString("city_name").equalsIgnoreCase(cmod.getCity()))
										{
										%>
									<option value="<%=ConnectionProvider.rs.getString(1)%>"
										selected="selected"><%=ConnectionProvider.rs.getString(1)%></option>
									<% } 
										else{%>

									<option value="<%=ConnectionProvider.rs.getString(1)%>"><%=ConnectionProvider.rs.getString(1)%></option>
									<%	}	
									
									}%>
								</select>
								<%}
           catch(Exception e)
            {
        	   System.out.println("Company>>city Loading>> wrong entry"+e);
        	   e.printStackTrace();
        	}
					
         %>
							</div>
						</div>
					</div>



					<%
            try
            {
                ConnectionProvider.rs=ConnectionProvider.SelectData("select state_name from state");
            %>

					<div class="col-md-3">
						<div class="form-group">
							<label>State</label>
							<!-- <a href="#" data-toggle="modal"
								data-target="#myModal1"><span style="color: red;"><i
									class="fa fa-plus"></i> State</span></a> -->
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-flag"></i></span>
								<select class="form-control select2 select2-hidden-accessible"
									id="state" name="state" style="width: 100%;" tabindex="-1"
									aria-hidden="true" required="required"
									oninvalid="setCustomValidity('Please Select State')"
									onchange="try{setCustomValidity('')}catch(e){}">
									<option>--Select--</option>
									<% while(ConnectionProvider.rs.next()){
										if(ConnectionProvider.rs.getString("state_name").equalsIgnoreCase(cmod.getState()))
										{
										%>
									<option value="<%=ConnectionProvider.rs.getString(1)%>"
										selected="selected"><%=ConnectionProvider.rs.getString(1)%></option>
									<% } 
										else{%>

									<option value="<%=ConnectionProvider.rs.getString(1)%>"><%=ConnectionProvider.rs.getString(1)%></option>

									<%	}	
									
									}%>




								</select>
								<%}
           catch(Exception e)
            {
        	   System.out.println("Company>>state Loading>> wrong entry"+e);
        	     e.printStackTrace();
        		
        	
            }
         %>
							</div>
						</div>
					</div>



					<%
            try
            {
                ConnectionProvider.rs=ConnectionProvider.SelectData("select country_name from country");
			 %>

					<div class="col-md-3">
						<div class="form-group">
							<label>Country</label>
							<!--  <a href="#" data-toggle="modal"
								data-target="#myModal1"><span style="color: red;"><i
									class="fa fa-plus"></i> Country</span></a> -->
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-flag"></i></span>
								<select class="form-control select2 select2-hidden-accessible"
									id="country" name="country" style="width: 100%;" tabindex="-1"
									aria-hidden="true" required="required"
									oninvalid="setCustomValidity('Please Select Country')"
									onchange="try{setCustomValidity('')}catch(e){}">
									<option>--Select--</option>
									<% while(ConnectionProvider.rs.next()){
										if(ConnectionProvider.rs.getString("country_name").equalsIgnoreCase(cmod.getCountry()))
										{
										%>
									<option value="<%=ConnectionProvider.rs.getString(1)%>"
										selected="selected"><%=ConnectionProvider.rs.getString(1)%></option>
									<% } 
										else{%>

									<option value="<%=ConnectionProvider.rs.getString(1)%>"><%=ConnectionProvider.rs.getString(1)%></option>

									<%	}	
									
									}%>


								</select>
								<%}
           catch(Exception e)
            {	
        		
        	   System.out.println("Company>>Country Loading>> wrong entry"+e);
        	 e.printStackTrace();
        	 ConnectionProvider.CloseAllGlobConnection();
             
            }finally{
            	ConnectionProvider.CloseAllGlobConnection();
            }
					
         %>
							</div>
						</div>
					</div>



					<div class="col-md-3">
						<div class="form-group">
							<label>ZipCode </label>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-map-pin"></i></span>
								<input type="text" id="zipcode" name="zipcode"
									value="<%=cmod.getZipcode() %>" placeholder="Enter Zipcode.."
									class="form-control" required="required" maxlength="6" min="6"
									max="6" onkeypress="return isNumberKey(event);"
									oninvalid="setCustomValidity('Please Enter Zip Code')"
									onchange="try{setCustomValidity('')}catch(e){}">
							</div>
						</div>
					</div>




					<div class="col-md-12">&nbsp;</div>
					<div class="col-md-2" style="position: relative; left: 350px">
						<button type="submit" id="btn_submit" name="btn_submit" onclick="return ValidatePassword();"
							class="btn btn-block btn-success btn-lg" value="<%=btn_submit %>">
							<i class="<%= icon_btnsubmit %>"></i>
							<%= btn_submit %></button>
					</div>
					<div class="col-md-2" style="position: relative; left: 350px">
						<button type="reset" class="btn btn-block btn-warning btn-lg">
							<i class="fa fa-refresh"></i> Reset
						</button>
					</div>

					<div class="col-md-2" style="position: relative; left: 350px">
						<a href="./CompanyReport.jsp"
							class="btn btn-block btn-info btn-lg">View Employers</a>
					</div>




					<div class="col-md-12">&nbsp;</div>

				</div>
	</form>

	<!-- body content wrapper end -->
</div>


<!-- .1] For City start -->
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<form action="./AddNature" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add City</h4>
				</div>
				<div class="modal-body">
					<div class="form-group has-success">
						<input type="text" class="form-control" name="inputSuccess"
							id="inputSuccess" placeholder="Enter city ">
					</div>
				</div>
				<div class="col-md-3">
					<input type="submit" style="position: relative; left: 215px"
						value="ADD" name="btnsubmit" class="btn btn-block btn-success">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</form>

	</div>
</div>
<!-- .1] For City end -->



<!-- .2] For State start -->
<!-- Modal -->
<div class="modal fade" id="myModal1" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<form action="./AddNature" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add State</h4>
				</div>
				<div class="modal-body">
					<div class="form-group has-success">
						<input type="text" class="form-control" name="inputSuccess"
							id="inputSuccess" placeholder="Enter State ">
					</div>
				</div>
				<div class="col-md-3">
					<input type="submit" style="position: relative; left: 215px"
						value="ADD" name="btnsubmit" class="btn btn-block btn-success">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</form>

	</div>
</div>
<!-- .2] For City end -->


<!-- .1] For Country start -->
<!-- Modal -->
<div class="modal fade" id="myModal2" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<form action="./AddNature" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add Country</h4>
				</div>
				<div class="modal-body">
					<div class="form-group has-success">
						<input type="text" class="form-control" name="inputSuccess"
							id="inputSuccess" placeholder="Enter country ">
					</div>
				</div>
				<div class="col-md-3">
					<input type="submit" style="position: relative; left: 215px"
						value="ADD" name="btnsubmit" class="btn btn-block btn-success">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</form>

	</div>
</div>
<!-- .3] For Country end -->


</div>
</div>

<%@ include file="./afooter.jsp"%>
