<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Jobber</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
<!-- Morris chart -->
<link rel="stylesheet" href="bower_components/morris.js/morris.css">
<!-- jvectormap -->
<link rel="stylesheet"
	href="bower_components/jvectormap/jquery-jvectormap.css">
<!-- Date Picker -->
<link rel="stylesheet"
	href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet"
	href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
	<!-- favicon icons -->
<link rel="shortcut icon" href="assets/images/jobber1-117x93.png"
	type="image/x-icon">
<!-- <link rel="icon" type="image/png" sizes="32x32" href="./dist/favicon/favicon1.ico">
<link rel="icon" type="image/png" sizes="96x96" href="./dist/favicon/favicon1.ico">
<link rel="icon" type="image/png" sizes="16x16" href="./dist/favicon/favicon1.ico"> -->
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="./dist/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">

</head>

<body class="hold-transition skin-blue sidebar-mini">
	<header class="main-header"> <!-- Logo --> <a href="#"
		class="logo"> <!-- mini logo for sidebar mini 50x50 pixels --> <span
		class="logo-mini"><b>J</b>B</span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>Jobber</b></span>
	</a> <!-- Header Navbar: style can be found in header.less --> <nav
		class="navbar navbar-static-top"> <!-- Sidebar toggle button-->
	<a href="#" class="sidebar-toggle" data-toggle="push-menu"
		role="button"> <span class="sr-only">Toggle navigation</span>
	</a> <% 
if(session.getAttribute("Uname")==null)
{%> <jsp:forward page="./Home.jsp"></jsp:forward> <%}%><!--  <script
		src="./jQry/jquery-3.2.1.js"></script>  -->
		<!-- <script>
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
</script> -->
	<div class="navbar-custom-menu">
		<ul class="nav navbar-nav">
			<!-- Messages: style can be found in dropdown.less-->
			<!-- Notifications: style can be found in dropdown.less -->
			<!-- Tasks: style can be found in dropdown.less -->
			<!-- User Account: style can be found in dropdown.less -->

			<!-- Control Sidebar Toggle Button -->
			<li><a href="#" data-toggle="control-sidebar"><i
					class="fa fa-gears"></i></a></li>
		</ul>
	</div>
	</nav> </header>