<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Edit Modified Rodnan Skin Score Form</title>
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
						<form:form action="rodnan_create.it?id=${patient.id }" method="post" commandName="form">
					<div>
						<br><p class="titles" style="color:goldenrod">Modified Rodnan Skin Score</p><br>		
					</div>	
					<form:hidden path="id" value="${form.getId() }"/>
						<form:hidden path="patient.id" value="${patient.getId()}"/>
						<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
						<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
						<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
						
							<table border="1px" class="navigation" style="margin:0px auto;">
							<tr>
								<td></td>
								<td><b>Uninvolved</b></td>
								<td><b>Mild Thickening</b></td>
								<td><b>Moderate Thickening</b></td>
								<td><b>Severe Thickening</b></td>
							</tr>
							
							<tr>
								<td>Face</td>
									<form:hidden path="bodyParts[0].bodyPart" value="Face"/>
									<form:hidden path="bodyParts[0].side" value=""/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[0].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[0].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[0].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[0].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>
							
							<tr>
								<td>Neck</td>
									<form:hidden path="bodyParts[1].bodyPart" value="Neck"/>
									<form:hidden path="bodyParts[1].side" value=""/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[1].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[1].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[1].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[1].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>			
							
							<tr>
								<td>Anterior Chest</td>
									<form:hidden path="bodyParts[2].bodyPart" value="Anterior Chest"/>
									<form:hidden path="bodyParts[2].side" value=""/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[2].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[2].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[2].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[2].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>		
							
							<tr>
								<td>Abdomen</td>
									<form:hidden path="bodyParts[3].bodyPart" value="Abdomen"/>
									<form:hidden path="bodyParts[3].side" value=""/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[3].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[3].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[3].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[3].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>
							
							<tr>
								<td>Upper Back</td>
									<form:hidden path="bodyParts[4].bodyPart" value="Upper Back"/>
									<form:hidden path="bodyParts[4].side" value="upper"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[4].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[4].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[4].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[4].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>							
							
							<tr>
								<td>Lower Back</td>
									<form:hidden path="bodyParts[5].bodyPart" value="Lower Back"/>
									<form:hidden path="bodyParts[5].side" value="lower"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[5].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[5].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[5].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[5].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>		
							
							
							
							
							<tr>
								<td>Upper Arm (Left)</td>
									<form:hidden path="bodyParts[6].bodyPart" value="Upper Arm"/>
									<form:hidden path="bodyParts[6].side" value="left"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[6].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[6].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[6].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[6].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>

							<tr>
								<td>Upper Arm (Right)</td>
									<form:hidden path="bodyParts[7].bodyPart" value="Upper Arm"/>
									<form:hidden path="bodyParts[7].side" value="right"/>								
								<td><form:radiobutton required="true" value="0" path="bodyParts[7].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[7].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[7].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[7].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>	

							<tr>
								<td>Forearm (Left)</td>
									<form:hidden path="bodyParts[8].bodyPart" value="Forearm"/>
									<form:hidden path="bodyParts[8].side" value="left"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[8].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[8].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[8].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[8].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>

							<tr>
								<td>Forearm (Right)</td>
									<form:hidden path="bodyParts[9].bodyPart" value="Forearm"/>
									<form:hidden path="bodyParts[9].side" value="right"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[9].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[9].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[9].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[9].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>	

							<tr>
								<td>Hand (Left)</td>
									<form:hidden path="bodyParts[10].bodyPart" value="Hand"/>
									<form:hidden path="bodyParts[10].side" value="left"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[10].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[10].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[10].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[10].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>

							<tr>
								<td>Hand (Right)</td>
									<form:hidden path="bodyParts[11].bodyPart" value="Hand"/>
									<form:hidden path="bodyParts[11].side" value="right"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[11].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[11].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[11].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[11].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>	

							<tr>
								<td>Fingers (Left)</td>
									<form:hidden path="bodyParts[12].bodyPart" value="Fingers"/>
									<form:hidden path="bodyParts[12].side" value="left"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[12].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[12].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[12].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[12].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>

							<tr>
								<td>Fingers (Right)</td>
									<form:hidden path="bodyParts[13].bodyPart" value="Fingers"/>
									<form:hidden path="bodyParts[13].side" value="right"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[13].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[13].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[13].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[13].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>	

							<tr>
								<td>Thigh (Left)</td>
									<form:hidden path="bodyParts[14].bodyPart" value="Thigh"/>
									<form:hidden path="bodyParts[14].side" value="left"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[14].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[14].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[14].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[14].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>

							<tr>
								<td>Thigh (Right)</td>
									<form:hidden path="bodyParts[15].bodyPart" value="Thigh"/>
									<form:hidden path="bodyParts[15].side" value="right"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[15].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[15].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[15].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[15].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>	
							
							<tr>
								<td>Leg (Left)</td>
									<form:hidden path="bodyParts[16].bodyPart" value="Leg"/>
									<form:hidden path="bodyParts[16].side" value="left"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[16].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[16].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[16].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[16].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>

							<tr>
								<td>Leg (Right)</td>
									<form:hidden path="bodyParts[17].bodyPart" value="Leg"/>
									<form:hidden path="bodyParts[17].side" value="right"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[17].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[17].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[17].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[17].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>		

							<tr>
								<td>Foot (Left)</td>
									<form:hidden path="bodyParts[18].bodyPart" value="Foot"/>
									<form:hidden path="bodyParts[18].side" value="left"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[18].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[18].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[18].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[18].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>

							<tr>
								<td>Foot (Right)</td>
									<form:hidden path="bodyParts[19].bodyPart" value="Foot"/>
									<form:hidden path="bodyParts[19].side" value="right"/>
								<td><form:radiobutton required="true" value="0" path="bodyParts[19].score" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>									
								<td><form:radiobutton required="true" value="1" path="bodyParts[19].score" />1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="2" path="bodyParts[19].score" />2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><form:radiobutton required="true" value="3" path="bodyParts[19].score" />3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>	
							
												
							</table>
<br><br><br>
				
					
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Update Form" class="btnSave"></span>
					<a href="rodnan_view.it?pid=${patient.getId() }&fid=${form.id}"><span class="btn"><input type="button"
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