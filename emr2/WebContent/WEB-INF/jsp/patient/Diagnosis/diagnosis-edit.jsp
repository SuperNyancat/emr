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
	<jsp:param name="title" value="Edit Diagnosis" />
	<jsp:param name="selected" value="patients" />
</jsp:include>

<div class="pageCtrl">

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
			<form:form action="diagnosis_update.it?pid=${patient.id }&fid=${form.id }" method="post" commandName="form">
				<form:hidden path="id" value="${form.id }"/>
				<form:hidden path="patient.id" value="${form.patient.id }"/>
				<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
				<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
				<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
						
				
				<div>
					<br><p class="titles" style="color:goldenrod">Diagnosis</p><br>		
				</div>
				<br><br>
					
				<label class="bigfont"><h4>Primary Diagnosis</h4></label><br><br>
					<div>
						<form:textarea rows="4" cols="50" style="width:700px; height:100px;" path="primaryDiagnosis" value="${form.primaryDiagnosis }"/>
						
					</div>
					<br><br>
								
				<label class="bigfont"><h4>Secondary Diagnosis</h4></label><br><br>
					<div>
						<form:textarea rows="4" cols="50" style="width:700px; height:100px;" path="secondaryDiagnosis" value="${form.secondaryDiagnosis }"/>
						
					</div>
					<br><br>
			
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Save" class="btnSave"></span></li>
					<a href="diagnosis_view.it?id=${patient.getId() }"><span class="btn"><input type="button"
							value="Cancel" class="btnCancel"></span></a>
					<span class="btn"><input type="button"
						value="Back to Top" class="btnTop"></span>
				</ul>
			</section>
			</form:form>
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