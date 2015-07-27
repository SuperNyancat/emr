<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
</head>

<body>

<div id="wrap">
<jsp:include page="../headers/admin-header.jsp">
	<jsp:param name="title" value="View Medicine" />
	<jsp:param name="selected" value="medicines" />
</jsp:include>
<div class="pageCtrl">

<ul class="ctrlBtn listSpace">
	<li><span class="btn"><form:form commandName="medicine" action="edit_medicine.it" method="GET">
			<form:hidden path="id" value="${medicine.id }" />
			<input type="submit" value="Edit" class="btnEdit" />
		</form:form></span></li>
	<li><span class="btn"><input type="button" value="Delete" class="btnDel"></span></li>
</ul>
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper">
	

	

	<form class="crmForm">
            <section class="settingBody clrfix">		
			<div class = "left">
				<jsp:include page="../headers/admin-left.jsp" />
			</div>
			
			<div class="right">
			<ul>			
			<h4>Medicine Record</h4>
			<li><label>Generic Name:</label> <span>${medicine.getGenericName()}</span> </li>
			<li><label>Brand Name:</label> <span>${medicine.getBrandName()}</span> </li>
			<li><label>Uses:</label> <span>${medicine.getUses()}</span> </li>
			<li><label>Side Effects:</label> <span>${medicine.getSideEffects()}</span> </li>

			</ul>
			</div>
		</section>			
		

	</form>

	
	
	
</div>
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>

</body>
</html>