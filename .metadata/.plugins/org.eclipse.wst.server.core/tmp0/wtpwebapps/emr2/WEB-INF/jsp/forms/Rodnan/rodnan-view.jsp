<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>View Modified Rodnan Skin Score Form</title>
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
	<li><span class="btn">
		<form:form commandName="form" action="rodnan_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="rodnan_edit.it" method="GET">
			<form:hidden path="patient.id" value="${patient.id }" />
			<form:hidden path="id" value="${form.id }" />
			<input type="submit" value="Edit" class="btnEdit" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="rodnan_delete.it" method="GET">
			<form:hidden path="patient.id" value="${patient.id }" />
			<form:hidden path="id" value="${form.id }" />
			<input type="submit" value="Delete" class="btnDel" onclick="myFunction()"/>
		</form:form>
	</span></li>
</ul>
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper">		

	
	<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="forms" />
			</jsp:include>
	
		<form class="crmForm">
			<div class="tab-content">
				<section class="settingBody clrfix">		
					<div class = "left">
						<jsp:include page="../../headers/patient-left.jsp" />
					</div>
					
						<div class="right">
							<div>
								<br><p class="titles" style="color:goldenrod">Modified Rodnan Skin Score</p><br>		
							</div>
							<br><br>																								
							
							<table border="1px" class="navigation" style="margin:0px auto;">
							<tr>
								<th>Body Part</th>
								<th colspan="2">Score</th>
							</tr>
							
							<c:forEach varStatus="i" begin="0" step="1" end="5">
							<tr>
								<td>${form.bodyParts[i.index].bodyPart }</td>
								<td style="text-align: center;" colspan="2">${form.bodyParts[i.index].score }</td>
							</tr>
							</c:forEach>
							
							<tr>
								<td>Total</td>
								<td style="text-align: center;" colspan="2">${form.faceScore }</td>
							</tr>
							</table>
							<br><br>
							
						<table border="1px" class="navigation" style="margin:0px auto;">
							<tr>
								<th>Body Part</th>
								<th>Score (Left)</th>
								<th>Score (Right)</th>
							</tr>
							<c:forEach varStatus="i" begin="6" end="${fn:length(form.bodyParts) }" step="2">
								<tr>
									<td>${form.bodyParts[i.index].bodyPart }</td>
									<td style="text-align: center;">${form.bodyParts[i.index].score }</td>
									<td style="text-align: center;">${form.bodyParts[i.index+1].score }</td>							
								</tr>
							</c:forEach>	
							<tr>
								<th>Total Skin Score</th>
								<th style="text-align: center;" colspan="2">${form.score }</th	>
							</tr>
											
						</table>
							
						
						</div>	
					<br><br><br>
			
					</section>
					<div class="lowernav1">
						<section class="paging">
							<ul>
							<c:if test="${ form.getRevisionHistory().getDateModified() != null}">
								<li><label>Date Modified</label>:  <span>${ form.getRevisionHistory().getDateModified() }</span></li>|
								<li><label>Modified By</label>:  <span>${ form.getRevisionHistory().getModifiedBy().getUsername() }</span></li>
							</c:if>
								<br/>
								<li><label>Date Created</label>:  <span>${ form.getRevisionHistory().getDateCreated() }</span></li>|
								<li><label>Created By</label>:  <span>${ form.getRevisionHistory().getCreatedBy().getUsername() }</span></li>
							</ul>
						</section>
					</div>		
				</div>
			</div>
		</form>
		
	</div>
	
		
</div>
	
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>
</div>
</body>
</html>