<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update User Password | Jobber</title>
</head>
<body>

	<jsp:include page="./aheader.jsp"></jsp:include>
	<jsp:include page="./alside.jsp"></jsp:include>
	<jsp:include page="./arside.jsp"></jsp:include>
	<script type="text/javascript">
<!--

//-->
function ValidatePassword(){
	document.getElementById("ValidatePassword").innerHTML="";
	if(document.getElementById("txt_new_pass").value != document.getElementById("txt_confirm_pass").value)
{
	document.getElementById("ValidatePassword").innerHTML="Password Not Match";
	document.getElementById("txt_new_pass").value="";
	document.getElementById("txt_confirm_pass").value="";
return false;	
}	
}

</script>
	<div class="content-wrapper">
		<div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
			<div class="box box-header box-info">
				<h2 class="box-title">Change Password</h2>
			</div>
			<div class="box-body">

				<form action="./UpdatePasswordController" method="post">
					<div class="row">
						<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">&nbsp;</div>
						<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
							<div class="form-group">
								<label>old Password </label>
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-user"></i></span>
									<input type="password" id="txt_old_pass" name="txt_old_pass"
										placeholder="Enter Username.." class="form-control" maxlength="8"
										required="true">
								</div>
							</div>
						</div>

						<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">&nbsp;</div>

					</div>




					<div class="row">
						<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">&nbsp;</div>
						<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
							<div class="form-group">
								<label>New Password </label>
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-user"></i></span>
									<input type="password" id="txt_new_pass" name="txt_new_pass" maxlength="8"
										placeholder="Enter New Password" class="form-control"
										required="true">
								</div>
							</div>
						</div>

						<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">&nbsp;</div>

					</div>

					<div class="row">
						<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">&nbsp;</div>
						<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
							<div class="form-group">
								<label>Confirm Password <span id="ValidatePassword"
									style="color: red;"></span>
								</label>
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-user"></i></span>
									<input type="password" id="txt_confirm_pass"
										name="txt_confirm_pass" placeholder="Enter Confirm Password" maxlength="8"
										class="form-control" required="true"
										onblur="return ValidatePassword();">
								</div>
							</div>
						</div>

						<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">&nbsp;</div>

					</div>


					<div class="row">
						<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">&nbsp;</div>
						<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
							<div class="form-group">
								<div class="input-group">

									<div class="row">
										<div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
											<center>
												<button type="submit" name="btn_submit" id="btn_submit"
													value="Change_password" class=" btn btn-info">
													<i class="fa fa-key"></i>&nbsp;Change
												</button>
											</center>
										</div>

										<div class="col-md-6 col-sm-6 col-lg-6 col-xs-6">
											<center>
												<button type="reset" name="btn_submit" id="btn_submit"
													value="Change_password" class=" btn btn-danger">
													<i class="fa fa-refresh"></i>&nbsp;Reset
												</button>
											</center>
										</div>


									</div>



								</div>
							</div>
						</div>

						<div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">&nbsp;</div>

					</div>



				</form>

			</div>

		</div>
	</div>



	<jsp:include page="./afooter.jsp"></jsp:include>



</body>
</html>