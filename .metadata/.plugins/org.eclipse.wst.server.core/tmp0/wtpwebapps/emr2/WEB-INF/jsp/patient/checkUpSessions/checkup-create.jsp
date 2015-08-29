<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Create Check-Up Session</title>
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
			<form:form method="post" commandName="checkUp" action="create_checkup_session.it?id=${patient.getId() }">
			<li><label>Height:</label>		 
					<form:select path="heightFeet" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" >
						<option hidden="Feet">Feet</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
					</form:select> feet
					
					<form:select path="heightInches" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" >
						<option hidden="Inches">Inches</option>
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
				<li>Weight: <form:input type="text" path="weight" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" placeholder="Pounds(lbs)"/> lbs</li>
				<li>Blood Pressure: <form:input type="text" path="BP" required="true"/></li>
				<li><label>Doctor:</label> ${doctor.getPersonInfo().getFirstName() } ${doctor.getPersonInfo().getLastName() } ${doctor.getSuffix() }
						<!-- <select name="mydropdown">
						<option hidden="---">---</option>
							<optgroup label="Rheumatology">
								<option value="">Doctor A</option>
							</optgroup>
							
							<optgroup label="Another Specialization">
								<option value="">Doctor B</option>
							</optgroup>						
					</select>	-->
						
				</li>
				
				<br/><br/><h4>Symptoms</h4>
				<li><form:textarea path="symptoms"  rows="4" cols="50" style="width:500px; height:100px;"/></li>
				
				<c:if test="${nurse == null }">
				<br/><br/><h4>Review of Systems</h4>				
				<li><form:textarea path="reviewOfSystems"  rows="4" cols="50" style="width:500px; height:100px;"/></li>
				
				<br/><br/><h4>Assessment/Working Impression</h4>
				<li>
				<table>
					<tr>
						<td><label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspS<br>(Subjective)<br><br><br><br></label></td>
						<td><form:textarea path="subjective"  rows="4" cols="50" style="width:440px; height:100px;"/></td>					
					</tr>
					
					<tr>
						<td><label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspO<br>(Objective)<br><br><br><br></label></td>
						<td><form:textarea path="objective"  rows="4" cols="50" style="width:440px; height:100px;"/></td>					
					</tr>
					
					<tr>
						<td><label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspA<br>(Assessment)<br><br><br><br></label></td>
						<td><form:textarea path="assessment"  rows="4" cols="50" style="width:440px; height:100px;"/></td>					
					</tr>

					<tr>
						<td><label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspP<br>(Planning)<br><br><br><br></label></td>
						<td><form:textarea path="planning"  rows="4" cols="50" style="width:440px; height:100px;"/></td>					
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
					<a href="view_checkup_sessions.it?id=${patient.getId() }"><span class="btn"><input type="button"
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