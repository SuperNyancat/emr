<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
</head>

<body>
<div id="wrap">
<jsp:include page="../../headers/doctor-header.jsp">
	<jsp:param name="title" value="View Diagnosis" />
	<jsp:param name="selected" value="patients" />
</jsp:include>

<div class="pageCtrl">
<ul class="ctrlBtn">
<li><span class="btn">
		<form:form commandName="form" action="diagnosis_edit.it" method="GET">
			<form:hidden path="patient.id" value="${patient.id }" />
			<form:hidden path="id" value="${form.id }" />
			<input type="submit" value="Edit" class="btnEdit" />
		</form:form>
		</span></li>
		</ul>
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	<div class="wrapper prospects">
		<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="diagnosis" />
			</jsp:include>
 
		<div class="tab-content">
			<section class="settingBody clrfix">		
						<div class = "left">
						<jsp:include page="../../headers/patient-left.jsp" />
					</div>
			
			
			<div class="right">
			<p class="titles">Diagnosis</p><br>	
				
				
				<br><br>
					
				<label class="bigfont"><h4>Primary Diagnosis</h4></label><br><br>
					<div>
						<c:choose>
							<c:when test="${form.primaryDiagnosis != null }">
								${form.getPrimaryDiagnosis()}
							</c:when>
							<c:otherwise>
								No data yet. Click the edit button to add data.
							</c:otherwise>
						</c:choose>
						
					</div>
					<br><br>
								
				<label class="bigfont"><h4>Secondary Diagnosis</h4></label><br><br>
					<div>
					<c:choose>
							<c:when test="${form.secondaryDiagnosis != null }">
								${form.secondaryDiagnosis}
							</c:when>
							<c:otherwise>
								No data yet. Click the edit button to add data.
							</c:otherwise>
						</c:choose>
					</div>
					<br><br>
	
			</div>
			</section>
			
			<div class="lowernav1">
				<section class="paging">
					<ul>
					<c:if test="${ form.getRevisionHistory().getDateModified() != null}">
						<li><label>Date Modified</label>:  <span>${ form.getRevisionHistory().getDateModified() }</span></li> |
						<li><label>Modified By</label>:  <span>${ form.getRevisionHistory().getModifiedBy().getUsername() }</span></li>
					</c:if>
						<br/>
						<li><label>Date Created</label>:  <span>${ form.getRevisionHistory().getDateCreated() }</span></li> |
						<li><label>Created By</label>:  <span>${ form.getRevisionHistory().getCreatedBy().getUsername() }</span></li>
					</ul>
				</section>
			</div>		
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