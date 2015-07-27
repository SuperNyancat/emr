<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<!doctype html>
<html lang="en">
<head>
	<title>Archives</title>
	<meta charset="utf-8">
</head>

<body>

<div id="wrap">
<jsp:include page="../../headers/doctor-header.jsp">
	<jsp:param name="title" value="Doctor Home" />
	<jsp:param name="selected" value="patients" />
</jsp:include>


<div class="pageCtrl">
	<ul class="ctrlBtn">
		<li><span class="btn"><a href="archives_assembler.it?id=${patient.getId() }"><input type="button" value="Upload Photos" class="btnEdit"></a></span></li>
	</ul>
</div>

<div class="pageCtrl">
<c:choose>
	<c:when test="${errorMessage != null }">
		<div class="error">${errorMessage}</div>
		<c:remove var="errorMessage" scope="session" />
	</c:when>
	<c:when test="${successMessage != null }">
		<div class="success">${successMessage}</div>
		<c:remove var="successMessage" scope="session" />
	</c:when>
</c:choose>
</div>

<div class="content-wrap">
	<div class="wrapper">	
		<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
			<jsp:param name="selected" value="archives" />
		</jsp:include>
		
			<div class="tab-content">
				<div id="History" class="tab active">           
					<section class="settingBody clrfix">		
						<div class = "left">
						<jsp:include page="../../headers/patient-left.jsp" />
						</div>
			
			<div class="right" align="center">
			<p class="titles">Patient Archive</p><br><br><br>
			<ul><h4 align=left>Search Archive</h4>
			<form action="search_archive.it" method="GET">
				<input type="hidden" value="${patient.id }" name="id"/>
				<li> File Name: <input type="text" name="filename"><span class="submit"> <input type="submit" value="Go"></span></li>
			</form>
			</ul><br><br><br>

<table>
		
	
	<div style="overflow: scroll; height:400px; width:700px;">	
		<c:forEach items="${images }" var="image" varStatus="i">
			<a href="${image.getRelativePath() }" rel="lightbox"><img src="${image.getRelativePath() }" alt="Uploaded Image" style="width: 200px;height:200px;"/></a>
			<c:out value="${image.getFilename()}"/>				
		</c:forEach>
	</div>
	
	<tr>
		<td><c:out value="${image.getFilename()}"/></td>
	</tr>
	
</table>
							</div>
					</section>
					
					
				</div>
		
		</div>
		</div>
	</div>
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>
</body>
</html>