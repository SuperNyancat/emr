<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

<script type='text/javascript' src='http://code.jquery.com/jquery-git2.js'></script>
	<link rel="stylesheet" href="resources/css/reset.css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="resources/css/template.css">
	<link rel="stylesheet" href="resources/css/forms.css">
	<link rel="stylesheet" href="resources/css/form-popup.css">
	<link rel="stylesheet" href="resources/css/template-table.css">
	<link rel="stylesheet" href="resources/css/homepage.css">	
	<link rel="stylesheet" href="resources/css/tabs.css">	
	<link rel="stylesheet" href="resources/css/settings.css">
	<link rel="stylesheet" href="resources/css/expandCollapse.css">
</head>
<body>

	<h4 class="name">System Administrator</h4>
	<p>${adminUser.getUsername() }</p>
	<img src="resources/images/img_user.jpg" alt="profile picture">
	
	<br><br><br/>
	
	<p><a href="create_doctor_assembler.it" style="color:goldenrod; font-weight:bold; padding-left:18px">Create Doctor</a></p>
	<p><a href="create_nurse_assembler.it" style="color:goldenrod; font-weight:bold; padding-left:18px">Create Nurse</a></p>
	<p><a href="add_medicine_assembler.it" style="color:goldenrod; font-weight:bold; padding-left:18px">Add Medicine</a></p>
	<p><a href="add_disease_assembler.it" style="color:goldenrod; font-weight:bold; padding-left:18px">Add Disease</a></p>
	
</body>
</html>