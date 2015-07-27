<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Edit BASDAI Form</title>
	<meta charset="utf-8">
</head>

<body>
<div id="wrap">
<jsp:include page="../../headers/doctor-header.jsp">
	<jsp:param name="title" value="Doctor Home" />
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
				<jsp:param name="selected" value="forms" />
			</jsp:include>
 
		<div class="tab-content">
			<section class="settingBody clrfix">		
					<div class = "left">
						<jsp:include page="../../headers/patient-left.jsp" />
					</div>
			
			<div class="right">
			<p class="titles">The Bath Ankylosing Disease Activity Index (BASDAI)</p><br>	
				<form:form action="update_basdai.it?pid=${patient.getId()}&fid=${form.getId()}" method="post" commandName="form">
					<form:hidden path="id" value="${form.getId() }"/>
					<form:hidden path="patient.id" value="${patient.getId()}"/>
					<form:hidden path="ASMedication.id" value="${form.getASMedication().getId() }"/>
					<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
					<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
					<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
					<br/><br/>
					<li> a. If you are currently taking medication for your AS, please give the name and the dose that's on the bottle/packet: <br>
								
						<table>
							<tr>
								<th>Generic Name</th>
								<th>Brand Name</th>
								<th>Dosage</th>
								<th>Duration</th>
								<!-- <th>Others</th>-->
							</tr>
							<tr>
								<td><form:input value="${form.getASMedication().getGenericName()}" path="ASMedication.genericName"/></td>
								<td><form:input value="${form.getASMedication().getBrandName()}" path="ASMedication.brandName"/></td>
								<td><form:input value="${form.getASMedication().getDosage()}" path="ASMedication.dosage"/></td>
								<td><form:input value="${form.getASMedication().getDuration()}" path="ASMedication.duration"/></td>
								<!--  <td><form:input path="ASMedication.otherDetails"/></td>-->
							</tr>
						</table>
					</li>
					
					<br/><br/>
					<li>b. Please indicate the effectiveness of the medication in relieving your symptoms.<br>
					<h3>ON A SCALE FROM "NO EFFECT" (0) TO "VERY EFFECTIVE" (10):</h3><br>
					<form:radiobutton path="medicationEffectiveness" required="true" value="0"/>0 &nbsp 
					<form:radiobutton path="medicationEffectiveness" required="true" value="1"/>1 &nbsp
					<form:radiobutton path="medicationEffectiveness" required="true" value="2"/>2 &nbsp 
					<form:radiobutton path="medicationEffectiveness" required="true" value="3"/>3 &nbsp 
					<form:radiobutton path="medicationEffectiveness" required="true" value="4"/>4 &nbsp 
					<form:radiobutton path="medicationEffectiveness" required="true" value="5"/>5 &nbsp 
					<form:radiobutton path="medicationEffectiveness" required="true" value="6"/>6 &nbsp 
					<form:radiobutton path="medicationEffectiveness" required="true" value="7"/>7 &nbsp 
					<form:radiobutton path="medicationEffectiveness" required="true" value="8"/>8 &nbsp 
					<form:radiobutton path="medicationEffectiveness" required="true" value="9"/>9 &nbsp 
					<form:radiobutton path="medicationEffectiveness" required="true" value="10"/>10 &nbsp
					</li>
					<BR /><BR /><BR />
			
					
					<li><h3>ON A SCALE FROM "NONE" (0) TO "VERY SEVERE" (10):</h3>
					</li>
					<br>
					<li>1. How would you describe the overall level of fatigue/tiredness you have experienced?<br>
					<form:radiobutton path="question1" value="0" required="true" />0 &nbsp 
					<form:radiobutton path="question1" value="1" required="true" />1 &nbsp
					<form:radiobutton path="question1" value="2" required="true" />2 &nbsp 
					<form:radiobutton path="question1" value="3" required="true" />3 &nbsp 
					<form:radiobutton path="question1" value="4" required="true" />4 &nbsp 
					<form:radiobutton path="question1" value="5" required="true" />5 &nbsp 
					<form:radiobutton path="question1" value="6" required="true" />6 &nbsp 
					<form:radiobutton path="question1" value="7" required="true" />7 &nbsp 
					<form:radiobutton path="question1" value="8" required="true" />8 &nbsp 
					<form:radiobutton path="question1" value="9" required="true" />9 &nbsp 
					<form:radiobutton path="question1" value="10" required="true" />10 &nbsp				
					</li>
					<br>
					<li>2. How would you describe the overall level of AS neck, back, or hip pain you have had?<br>
					<form:radiobutton path="question2" value="0" required="true" />0 &nbsp 
					<form:radiobutton path="question2" value="1" required="true" />1 &nbsp
					<form:radiobutton path="question2" value="2" required="true" />2 &nbsp 
					<form:radiobutton path="question2" value="3" required="true" />3 &nbsp 
					<form:radiobutton path="question2" value="4" required="true" />4 &nbsp 
					<form:radiobutton path="question2" value="5" required="true" />5 &nbsp 
					<form:radiobutton path="question2" value="6" required="true" />6 &nbsp 
					<form:radiobutton path="question2" value="7" required="true" />7 &nbsp 
					<form:radiobutton path="question2" value="8" required="true" />8 &nbsp 
					<form:radiobutton path="question2" value="9" required="true" />9 &nbsp 
					<form:radiobutton path="question2" value="10" required="true" />10 &nbsp				
					</li>
					<br>
					<li>3. How would you describe the overall level of pain/swelling in joints other than neck, back, or hips you have had?<br>
					<form:radiobutton path="question3" value="0" required="true" />0 &nbsp 
					<form:radiobutton path="question3" value="1" required="true" />1 &nbsp
					<form:radiobutton path="question3" value="2" required="true" />2 &nbsp 
					<form:radiobutton path="question3" value="3" required="true" />3 &nbsp 
					<form:radiobutton path="question3" value="4" required="true" />4 &nbsp 
					<form:radiobutton path="question3" value="5" required="true" />5 &nbsp 
					<form:radiobutton path="question3" value="6" required="true" />6 &nbsp 
					<form:radiobutton path="question3" value="7" required="true" />7 &nbsp 
					<form:radiobutton path="question3" value="8" required="true" />8 &nbsp 
					<form:radiobutton path="question3" value="9" required="true" />9 &nbsp 
					<form:radiobutton path="question3" value="10" required="true" />10 &nbsp				
					</li>
					<br>
					<li>4. How would you describe the overall level of discomfort you have had from any areas tender to touch or pressure?<br>
					<form:radiobutton path="question4" value="0" required="true" />0 &nbsp 
					<form:radiobutton path="question4" value="1" required="true" />1 &nbsp
					<form:radiobutton path="question4" value="2" required="true" />2 &nbsp 
					<form:radiobutton path="question4" value="3" required="true" />3 &nbsp 
					<form:radiobutton path="question4" value="4" required="true" />4 &nbsp 
					<form:radiobutton path="question4" value="5" required="true" />5 &nbsp 
					<form:radiobutton path="question4" value="6" required="true" />6 &nbsp 
					<form:radiobutton path="question4" value="7" required="true" />7 &nbsp 
					<form:radiobutton path="question4" value="8" required="true" />8 &nbsp 
					<form:radiobutton path="question4" value="9" required="true" />9 &nbsp 
					<form:radiobutton path="question4" value="10" required="true" />10 &nbsp			
					</li>
					<br>
					<li>5. How would you describe the overall level of discomfort you have had from the time you wake up?<br>
					<form:radiobutton path="question5" value="0" required="true" />0 &nbsp 
					<form:radiobutton path="question5" value="1" required="true" />1 &nbsp
					<form:radiobutton path="question5" value="2" required="true" />2 &nbsp 
					<form:radiobutton path="question5" value="3" required="true" />3 &nbsp 
					<form:radiobutton path="question5" value="4" required="true" />4 &nbsp 
					<form:radiobutton path="question5" value="5" required="true" />5 &nbsp 
					<form:radiobutton path="question5" value="6" required="true" />6 &nbsp 
					<form:radiobutton path="question5" value="7" required="true" />7 &nbsp 
					<form:radiobutton path="question5" value="8" required="true" />8 &nbsp 
					<form:radiobutton path="question5" value="9" required="true" />9 &nbsp 
					<form:radiobutton path="question5" value="10" required="true" />10 &nbsp				
					</li>
					<br>
					<li>6. How long does your morning stiffness last from the time you wake up?<br>
					 <form:radiobutton path="question6" value="0" required="true" />0 &nbsp 
					 <form:radiobutton path="question6" value="2.5" required="true" />1/2 &nbsp
					 <form:radiobutton path="question6" value="5" required="true" />1 &nbsp 
					 <form:radiobutton path="question6" value="7.5" required="true" />1 1/2 &nbsp 
					 <form:radiobutton path="question6" value="10" required="true" />2 or more hours &nbsp 				
					</li>
					<br><br><br><br>
					
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Update Form" class="btnSave"></span>
					<a href="view_basdai.it?pid=${patient.getId() }&fid=${form.id}"><span class="btn"><input type="button"
							value="Cancel" class="btnCancel" onClick="viewPotentialsList()"></span></a>
					<span class="btn"><input type="button"
						value="Back to Top" class="btnTop"></span>
					<font style="padding-left:360px"></font>
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
	<span class="copy"><a href=""> All Rights Reserved. </a></span>
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>
</body>
</html>