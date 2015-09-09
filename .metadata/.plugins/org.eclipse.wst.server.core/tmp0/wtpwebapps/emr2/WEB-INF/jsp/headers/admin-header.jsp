<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html lang="en">
<head>
<title>${param.title}</title>
<meta charset="utf-8">
	<script type='text/javascript' src='http://code.jquery.com/jquery-git2.js'></script>
	
	<script src="resources/js/addDeleteRows.js"></script>
	<script src="resources/js/buttons.js"></script>
	<script src="resources/js/expandCollapse.js"></script>
	<script src="resources/js/jquery-1.9.1.min.js"></script>
	<script src="resources/js/lightbox.js"></script>
	<script src="resources/js/retypepwd.js"></script>
	<script src="resources/js/scripts.js"></script>
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<![endif]-->
	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome Admin!</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="resources/css/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
	<div class="page-title-container">
    <h4 align="center">UNIVERSITY OF SANTO TOMAS HOSPITAL</h4>
    <h1 align="center">Joint and Bone Center</h1>
    <div class="logo_2">
        <img src="resources/images/ust_logo.png">
        </div>
     <div class="logo">
        <img src="resources/images/usth_logo.png">
        </div>
        </div>		

    <!-- Navigation -->
   <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                	<c:url var="homeUrl" value="admin_homepage.it" />
				<c:url var="doctorsUrl" value="view_doctors.it" />
				<c:url var="NursesUrl" value="view_nurses.it" />
				<c:url var="reportsUrl" value="view_reports.it" />
				<c:url var="MedicinesUrl" value="view_medicines.it" />
				<c:url var="DiseasesUrl" value="view_diseases.it" />
				<c:url var="ReportsUrl" value="view_admin_reports.it?y=" />
				
				<li class="${param.selected == 'home' ? 'selected' : ''}">
				<a href="${homeUrl}">Home</a></li>
				<li class="${param.selected == 'doctors' ? 'selected' : ''}">
				<a href="${doctorsUrl }">Doctors</a></li>
				<li class="${param.selected == 'nurses' ? 'selected' : ''}">
				<a href="${NursesUrl }">Nurses</a></li>
				<li class="${param.selected == 'medicines' ? 'selected' : ''}">
				<a href="${MedicinesUrl }">Medicines</a></li>
				<li class="${param.selected == 'diseases' ? 'selected' : ''}">
				<a href="${DiseasesUrl }">Diseases</a></li>
				<li class="${param.selected == 'reports' ? 'selected' : ''}">
				<a href="${ReportsUrl }">Reports</a></li>
                </ul>
            
                <div class="navbar-header navbar-right">

                 <a class="navbar-brand dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Admin</a>
                <ul class="dropdown-menu">
                    <li><a href="#">Settings</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="admin_view.it">Edit Profile</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="#">Help</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="logout.it?">Logout</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
            <!-- /.container -->
       </div>
    </nav>
</head>

	 <!-- jQuery Version 1.11.1 -->
    <script src="resources/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
