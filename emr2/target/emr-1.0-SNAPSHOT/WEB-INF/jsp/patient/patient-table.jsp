<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<c:choose>
	<c:when test="${nurse != null }">
		<jsp:include page="../headers/nurse-header.jsp">
			<jsp:param name="title" value="Doctor Home" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../headers/doctor-header.jsp">
			<jsp:param name="title" value="Doctor Home" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:otherwise>
</c:choose>
<div class="pageCtrl">
 <c:choose>
	<c:when test="${errorSearch != null }">
		<div class="error">${errorSearch}</div>
		<c:remove var="errorSearch" scope="session"/>
	</c:when>
	<c:when test="${successMessage != null }">
		<div class="success">${successMessage}</div>
		<c:remove var="successMessage" scope="session"/>
	</c:when>
</c:choose><br>
	<ul class="ctrlBtn">
		<li><a href="create_patient_assembler.it"><span class="btn"><input type="button" value="New Patient" class="btnNew"></span></a></li>
	</ul>
</div>

<div class="pageCtrl">

</div>

<div class="content-wrap">
	
	<div class="wrapper prospects">
	
		<div class="tableSearch clrfix">
			<section>
			   <form method="post" action="search_patient.it" >
				<ul class="pro">
					<li><label>Name</label>:<input type="text" name="name"></li>

				</ul>

				<span class="submit">
					<input type="submit" value="Go">
				</span>
			    
				</form>
			</section>
		</div>
		

		<table class="tablecontent3">
						
						<tr>
					<th class="navblank">&nbsp;</th>
					<th class="pro">Patient Name<span class="greenArrow">&nbsp;</span></th>
					<th class="phn">E-mail Address<span class="greenArrow">&nbsp;</span></th>
					<th class="ind">Contact Number<span class="greenArrow">&nbsp;</span></th>
				</tr>
		<c:if test="${errorMessage != null }">
		<tr>
			<td><div class="info">${errorMessage}</div>
			<c:remove var="errorMessage" scope="session" /></td> 
			
		</tr>	
		</c:if>
		<tr>
			<c:forEach items="${patients}" var="p">
			<tr>
				
				<td><div class="blue"></div></td>
				<td class="pro"><a href="view_patient_profile.it?id=${p.getId()}" title="">${p.getPersonInfo().getFirstName()} ${p.getPersonInfo().getLastName()}</a></td>
				<td class="phn">${p.personInfo.email }</td>
				<td class="ind"><title="">${p.getPersonInfo().getContacts().get(0).getMobileNumber()}</a></td>
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
</body>
</html>