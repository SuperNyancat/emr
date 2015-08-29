<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Edit Check-Up Session</title>
	<meta charset="utf-8">
</head>

<body>
<div id="wrap">
<c:choose>
	<c:when test="${nurse != null }">
		<jsp:include page="../../headers/nurse-header.jsp">
			<jsp:param name="title" value="Doctor Home" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../../headers/doctor-header.jsp">
			<jsp:param name="title" value="Doctor Home" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:otherwise>
</c:choose>

<div class="pageCtrl">

</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	<div class="wrapper prospects">
		<div class="tabs">
		<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="checkup" />
			</jsp:include>
 
		<div class="tab-content">
			<section class="settingBody clrfix">		
			<div class = "left">
				<jsp:include page="../../headers/patient-left.jsp" />
			</div>
			
			<div class="right">
				<p class="titles">Check-up Record</p><br><br>
			
				<h4>Personal Details</h4>	
			<form:form method="post" commandName="form" action="update_checkup.it?pid=${patient.getId() }&fid=${form.getId() }">
			<form:hidden path="id" value="${form.getId() }"/>
			<form:hidden path="patient.id" value="${patient.getId() }" />
			<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
			<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
			<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
					<li><label>Height:</label>		 
					<form:select path="heightFeet" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" required="true">
						<option value="${form.getHeightFeet()}" >${form.getHeightFeet()} </option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
					</form:select> feet
					
					<form:select path="heightInches" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" required="true">
						<option value="${form.getHeightInches()}" >${form.getHeightInches()} </option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="7">8</option>
						<option value="7">9</option>
						<option value="7">10</option>
						<option value="7">11</option>
					</form:select> inches</li>
								
			<ul>
				<li>Weight: <form:input type="text" path="weight" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" value="${form.getWeight()}" placeholder="Pounds(lbs)" required="true"/> lbs</li>
				<li>Blood Pressure: <form:input type="text" path="BP" value="${form.getBP()}" required="true"/></li>			
				<li><label>Doctor:</label> ${doctor.getPersonInfo().getFirstName() } ${doctor.getPersonInfo().getLastName() } ${doctor.getSuffix() }
			
				</li>
				
				<br/><br/><h4>Symptoms</h4>
				<li><form:textarea path="symptoms" value="${form.getSymptoms()}" rows="4" cols="50" style="width:500px; height:100px;"/></li>
				
				<c:if test="${nurse == null }">
				<br/><br/><h4>Review of Systems</h4>				
				<li><form:textarea path="reviewOfSystems" value="${form.getReviewOfSystems()}" rows="4" cols="50" style="width:500px; height:100px;"/></li>
				
				<br/><br/><h4>Assessment/Working Impression</h4>
				<li>
				<table>
					<tr>
						<td><label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspS<br>(Subjective)<br><br><br><br></label></td>
						<td><form:textarea path="subjective" value="${form.getSubjective()}" rows="4" cols="50" style="width:440px; height:100px;"/></td>					
					</tr>
					
					<tr>
						<td><label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspO<br>(Objective)<br><br><br><br></label></td>
						<td><form:textarea path="objective" value="${form.getObjective()}" rows="4" cols="50" style="width:440px; height:100px;"/></td>					
					</tr>
					
					<tr>
						<td><label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspA<br>(Assessment)<br><br><br><br></label></td>
						<td><form:textarea path="assessment" value="${form.getAssessment()}" rows="4" cols="50" style="width:440px; height:100px;"/></td>					
					</tr>

					<tr>
						<td><label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspP<br>(Planning)<br><br><br><br></label></td>
						<td><form:textarea path="planning" value="${form.getPlanning()}" rows="4" cols="50" style="width:440px; height:100px;"/></td>					
					</tr>		
				</c:if>					
				</table>
				</li>
			</ul>
			<br><br><br>
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Save" class="btnSave"></span>
					<a href="view_checkup_session.it?pid=${patient.getId() }&fid=${form.getId()}"><span class="btn"><input type="button"
							value="Cancel" class="btnCancel"></span></a>
					<font style="padding-left:360px"></font>	
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