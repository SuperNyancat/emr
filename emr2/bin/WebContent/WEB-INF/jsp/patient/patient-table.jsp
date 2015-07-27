<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
	<title>Patients</title>
	<meta charset="utf-8">
	
	<link rel="stylesheet" href="resources/css/reset.css" type="text/css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="resources/css/template.css" type="text/css">
	<link rel="stylesheet" href="resources/css/forms.css" type="text/css">	
	<link rel="stylesheet" href="resources/css/form-popup.css" type="text/css">
	<link rel="stylesheet" href="resources/css/template-table.css" type="text/css">
	<link rel="stylesheet" href="resources/css/homepage.css" type="text/css">
	<!--[if lt IE 9]>
	<script src="resources/js/html5shiv.js"></script>
	<![endif]-->
</head>

<body>

<div id="wrap">

<jsp:include page="../header.jsp">
	<jsp:param name="title" value="Doctor Home" />
	<jsp:param name="selected" value="patients" />
</jsp:include>
<div class="pageCtrl">
	<ul class="ctrlBtn">
		<li><a href="create_patient_assembler.it"><span class="btn"><input type="button" value="New Patient" class="btnNew"></span></a></li>
	</ul>
</div>

<div class="pageCtrl">

</div>

<div class="content-wrap">
	
	<div class="wrapper prospects">

		<div class="tableHeader clrfix">
			<table border="1" class="navigation">
				<tr>
					<td class="navblank">&nbsp;</td>
					<td class="pro"><a href="">Patient's Name<span class="greenArrow">&nbsp;</span></a></td>
					<td class="phn"><a href="">Last Visit<span class="greenArrow">&nbsp;</span></a></td>
					<td class="ind"><a href="">Last Findings<span class="greenArrow">&nbsp;</span></a></td>
					<td class="web"><a href="">Contact Number<span class="greenArrow">&nbsp;</span></a></td>
				</tr>
			</table>
		</div>
		
		<div class="tableSearch clrfix">
			<section>
			   <form>
				<ul class="pro">
					<li><label>First Name</label>:<input type="text" value=""></li>

				</ul>
				<ul class="phn">
					<li><label>Last Name</label>:<input type="text" value=""></li>
				</ul>

				<span class="submit">
					<input type="submit" value="Go">
				</span>
			    
				</form>
			</section>
		</div>
		
		<div class="searchTool">
			<section> 
				<a href=""><img src="resources/images/icon_search2.png" alt="Search"></a>
				<span class="greenArrow">&nbsp;</span>
			</section>
		</div>

		<table class="tableContent">
		<tr><td><font color="red" size="1px">${errorMessage}</font>
			<c:remove var="errorMessage" scope="session" /></td> 	
		<tr>
			<c:forEach items="${patients}" var="p">
			<tr>
				
				<td><div class="blue"><span><input type="checkbox"></span></div></td>
				<td class="pro"><a href="view_patient_profile.it?id=${p.getId()}" title="">${p.getPersonInfo().getFirstName()} ${p.getPersonInfo().getLastName()}</a></td>
				<td class="phn">Jan 1, 2014</td> <!-- p.getUser().getDateModified() -->
				<td class="ind">Can't walk</td>
				<td class="web"><title="">${p.getPersonInfo().getContacts().get(0).getMobileNumber()}</a></td>
			</tr>			
			</c:forEach>
		</table>
		
		
		
		<div class="lowernav">
			<section class="alphabet">
				<ul>
					<li class="selected"><a href="">A</a></li>
					<li><a href="">B</a></li>
					<li><a href="">C</a></li>
					<li><a href="">D</a></li>
					<li><a href="">E</a></li>
					<li><a href="">F</a></li>
					<li><a href="">G</a></li>
					<li><a href="">H</a></li>
					<li><a href="">I</a></li>
					<li><a href="">J</a></li>
					<li><a href="">K</a></li>
					<li><a href="">L</a></li>
					<li><a href="">M</a></li>
					<li><a href="">N</a></li>
					<li><a href="">O</a></li>
					<li><a href="">P</a></li>
					<li><a href="">Q</a></li>
					<li><a href="">R</a></li>
					<li><a href="">S</a></li>
					<li><a href="">T</a></li>
					<li><a href="">U</a></li>
					<li><a href="">V</a></li>
					<li><a href="">W</a></li>
					<li><a href="">X</a></li>
					<li><a href="">Y</a></li>
					<li><a href="">Z</a></li>
				</ul>
			</section>
			<section class="paging">
				<ul>
					<li>
						<select class="perpage">
							<option>5 per page</option>
							<option>10 per page</option>
							<option>15 per page</option>
						</select>
					</li>
					<li>
						<p class="counter">Total Count <a href="">&lt;</a><span>1 to 10</span><a href="">&gt;</a></p></li>
				</ul>
			</section>
		</div>
	
	</div>
	<!-- end wrapper-->
</div>
<!-- end content-wrap-->

<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>
<!--end wrap-->

	<script src="resources/js/jquery-1.9.1.min.js"></script>
	<script src="resources/js/scripts.js"></script>
</body>
</html>