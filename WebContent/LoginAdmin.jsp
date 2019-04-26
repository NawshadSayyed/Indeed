
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Log in | Jobber </title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="./bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="./bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="./dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="./plugins/iCheck/square/blue.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<link rel="shortcut icon" href="assets/images/jobber1-117x93.png"
	type="image/x-icon">
<!-- <link rel="icon" type="image/png" sizes="32x32" href="./dist/favicon/favicon1.ico">
<link rel="icon" type="image/png" sizes="96x96" href="./dist/favicon/favicon1.ico">
<link rel="icon" type="image/png" sizes="16x16" href="./dist/favicon/favicon1.ico"> -->
<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Documentation</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="./bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="./bower_components/Ionicons/c/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="./dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="./dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="style.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<script type="text/javascript">

	function displaydiv() {
		document.getElementById("div_TryAgain").style.display = "block";
	}
</script>

</head>
<body class="hold-transition login-page"
	style="background-image: url('shubh.jpg'); background-size: cover">
	<div class="login-box">
		<div class="login-logo" style="color: white;">
			<b>Admin</b>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">Sign in to start your session</p>

			<form action="./LoginController" method="post">
				<div class="form-group has-feedback">
					<input type="email" name="Uname" id="Uname" class="form-control"
						placeholder="Email"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="Upass" id="Upass" class="form-control"
						placeholder="Password"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<!-- /.col -->
					
						<div class="col-md-6 col-sm-6 col-xl-6 col-lg-6">
						
						<button type="submit" name="btnSubmit"
							class="btn btn-primary btn-block btn-flat "
							><i class="fa fa-sign-in"> </i>&nbsp;Sign In</button>
							</div>
					<div class="col-md-6 col-sm-6 col-xl-6 col-lg-6">
					<button type="reset" name="btnSubmit"
							class="btn btn-danger btn-block btn-flat "
							 ><i class="fa fa-refresh"></i> &nbsp;Reset</button>
					</div>		
							
				
					
					
					<!-- /.col -->
				</div>
			</form>
			<br/>


			<a href="./forgot.jsp" style="position: relative; left: 90"><br/>I
				forgot my password</a><br> <br> <a href="./Home.jsp"
				><i class="fa fa-arrow-left">&nbsp;Back</i></a><br>

		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 3 -->
	<script src="./bower_components/jquery/dist/jquery.min.js"
		type="text/javascript"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- iCheck -->
	<script src="./plugins/iCheck/icheck.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' /* optional */
			});
		});
	</script>
	<!-- jQuery 3 -->
	<script src="./bower_components/jquery/dist/jquery.min.js"
		type="text/javascript"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- FastClick -->
	<script src="./plugins/fastclick/fastclick.min.js"
		type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="./dist/js/adminlte.min.js" type="text/javascript"></script>
	<!-- SlimScroll -->
	<script
		src="./bower_components/jquery-slimscroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<script
		src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"
		type="text/javascript"></script>
	<script src="docs.js" type="text/javascript"></script>


</body>
</html>