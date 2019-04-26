<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html >
<head>
  <!-- Site made with Mobirise Website Builder v4.8.1, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v4.8.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="assets/images/logo4.png" type="image/x-icon">
  <meta name="description" content="">
  <title>Home</title>
  <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
  <link rel="stylesheet" href="assets/tether/tether.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="assets/theme/css/style.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
</head>

<script type="text/javascript">

function ValidateResetCode(){
	document.getElementById("ResetCode_match").innerHTML="";
if(document.getElementById("hdn_resetCode").value != document.getElementById("txt_resetCode").value)
{
	document.getElementById("ResetCode_match").innerHTML="Please Enter Valid Code.";
	document.getElementById("txt_resetCode").value="";
return false;	
}	
}


function ValidatePassword(){
	document.getElementById("pass_match").innerHTML="";
	if(document.getElementById("New_Pass").value != document.getElementById("Confirm_pass").value)
{
	document.getElementById("pass_match").innerHTML="Password Not Match";
	document.getElementById("Confirm_pass").value="";
return false;	
}	
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;
}

</script>

<body style="background-color:teal;">
  <section class="cid-rj5XgnhML4 mbr-fullscreen" id="header15-0">

    
<div style="margin-top: 15%;">&nbsp;</div>
    

    <div class="container align-right">
<div class="row">
    <div class="mbr-white col-lg-8 col-md-7 content-container">
        <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-1">
            Forget Password</h1>
        <p class="mbr-text pb-3 mbr-fonts-style display-5" style="color:white;">
            Please Check Email id find Reset code Enter New Password.<br>
            Set New Password which is max lenght of 8 character and one Special Symbol <br/>Example. Abcd@123</p>
    </div>
    <div class="col-lg-4 col-md-5">
    <div class="form-container">
        <div class="media-container-column" data-form-type="formoid">
            <div data-form-alert="" hidden="" class="align-center">Thanks for filling out the form!</div>
            <form class="mbr-form" action="./ForgetPass" method="post" >
             
              <input type="hidden" maxlength="10" name="hdn_resetCode"   required="required" id="hdn_resetCode" value="<%= session.getAttribute("ResetCode").toString().trim() %>">
             
               <div data-for="name">
                    <div class="form-group">
                        <input type="text" class="form-control px-3" onkeypress="return isNumberKey(event);" maxlength="10" onblur="return ValidateResetCode();"   name="txt_resetCode"  placeholder="Enter Reset Code" required="required" id="txt_resetCode">
                    </div>
                </div>
                 <div data-for="name">
                    <div class="form-group">
                        <input type="password" class="form-control px-3" name="New_Pass"  placeholder="New Password" maxlength="8" required="required" id="New_Pass">
                    </div>
                </div>
                <div data-for="email">
                    <div class="form-group">
                        <input type="password" onblur="return ValidatePassword();" class="form-control px-3" name="Confirm_pass" maxlength="8"  placeholder="Confirm Password" required="required" id="Confirm_pass" >
                    </div>
                </div>
                <span id="pass_match"
								style="color: Yellow;font-style: oblique;"></span>
                <span id="ResetCode_match"
								style="color: Yellow;font-style: oblique;"></span>
                <span class="input-group-btn"><button type="submit" class="btn btn-secondary btn-form display-4">Reset Password</button></span>
            </form>
        </div>
    </div>
    </div>
</div>
    </div>
    
</section>


  <section class="engine"></section><script src="assets/web/assets/jquery/jquery.min.js"></script>
  <script src="assets/popper/popper.min.js"></script>
  <script src="assets/tether/tether.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/smoothscroll/smooth-scroll.js"></script>
  <script src="assets/theme/js/script.js"></script>
  <script src="assets/formoid/formoid.min.js"></script>
  
  
</body>
</html>