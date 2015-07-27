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
	<jsp:param name="title" value="View Disease" />
	<jsp:param name="selected" value="diseases" />
</jsp:include>
<div class="pageCtrl">

<ul class="ctrlBtn listSpace">
	<li><span class="btn"><form:form commandName="disease" action="edit_disease.it" method="GET">
			<form:hidden path="id" value="${disease.id }" />
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
			<form class="crmFormtabs">
			<h4>Disease Record</h4>
			
			<ul>			
			<li><label>Disease:</label> <span>${disease.getName()}</span> </li>
			<li><label>Type:</label> <span>${disease.getType()}</span> </li>
			<li><label>Description:</label> <span>${disease.getDescription()}</span> </li>
			
			<table class="tableContenttransdis">	
			<tr>
				<th>Stage</th>
				<th>Description</th>
			</tr>
			
			<tr>
				<td class="pro">1</td>
				<td class="ind">${disease.getStage1Desc()}</td>
		
			</tr>
			<tr>
				<td class="pro">2</td>
				<td class="ind">${disease.getStage2Desc()}</td>
		
			</tr>
			<tr>
				<td class="pro">3</td>
				<td class="ind">${disease.getStage3Desc()}</td>
		
			</tr>
			<tr>
				<td class="pro">4</td>
				<td class="ind">${disease.getStage4Desc()}</td>
		
			</tr>

		</table>
			</ul>
			</form>
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