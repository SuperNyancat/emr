<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Admin Home</title>
	<meta charset="utf-8">
	
	<link href="resources/css/homepage.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="resources/css/template.css" type="text/css"/>
	<link rel="stylesheet" href="resources/css/reset.css"  type="text/css" />
	<link rel="stylesheet" href="resources/css/forms.css" type="text/css"/>	
	<link rel="stylesheet" href="resources/css/form-popup.css" type="text/css"/>
	<link rel="stylesheet" href="resources/css/template-table.css" type="text/css"/>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
	
	<!--[if lt IE 9]>
	<script src="resources/js/html5shiv.js"></script>
	<![endif]-->
</head>

<body>

<div id="wrap">
<jsp:include page="../headers/admin-header.jsp">
	<jsp:param name="title" value="Administrator Home" />
	<jsp:param name="selected" value="home" />
</jsp:include>



<div class="pageCtrl noContent"><!--no content--></div>

<div class="content-wrap">
	
	<div class="wrapper home">

	<section class="accDetails clrfix">
	<div class="profile">
		<h3>System Administrator</h3>
		<ul>
			<li class="photo"><img src="resources/images/img_user.jpg" alt="" >	</li>
		</ul>
	</div>
	<div class="quicklinks">
		<ul>
			<li><a href="create_doctor_assembler.it">
				<span class="blue"><img src="resources/images/icon_potentials.png" alt="" ></span>
				<span class="link">Create Doctor</span></a></li>
			<li><a href="create_nurse_assembler.it">
				<span class="blue"><img src="resources/images/icon_potentials.png" alt="" ></span>
				<span class="link">Create Nurse </span></a></li>
			<li><a href="add_medicine_assembler.it">
				<span class="blue"><img src="resources/images/icon_contacts.png" alt="" ></span>
				<span class="link">Add Medicine</span></a></li>
			<li><a href="add_disease_assembler.it">
				<span class="blue"><img src="resources/images/icon_editprofile.png" alt="" ></span>
				<span class="link">Add Disease</span></a></li>
		</ul>
	</div>
	</section>
		
	<section>
		<h1>Latest Reports</h1>
		<table>
		<tr>
			<th>Date</th>
			<th>Status</th>
		</tr>
		<tr>
			<td>January</td>
			<td>some statistics or update</td>

		</tr>
		<tr>
			<td>February</td>
			<td>some report for the month</td>

		</tr>
		</table>
	</section>	
	</div>
	<!-- end wrapper-->
</div>
<!-- end content-wrap-->

<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>


</div>
	<script src="resources/js/jquery-1.9.1.min.js"></script>
	<script src="resources/js/scripts.js"></script>
</body>
</html>