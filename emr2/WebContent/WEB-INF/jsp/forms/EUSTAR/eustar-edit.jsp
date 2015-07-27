<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Edit EUSTAR Form</title>
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
			<p class="titles"></p><br>	
		<form:form action="eustar_update.it?pid=${patient.id }&fid=${form.id }" method="post" commandName="form">
				<form:hidden path="id" value="${form.getId() }"/>
				<form:hidden path="patient.id" value="${patient.getId()}"/>
				<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
				<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
				<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
						
				
				<div class="right">
				<p class="titles">EUSTAR Systemic Sclerosis Activity Score</p><br>	
				
				<table border="1px;">
				<tr>
				<th style="width:300px;">Parameter
				<th style="width:100px;">Score
				<th style="width:300px;">Asessment
				</tr>
				
				<tr>
				<td>Modified Rodnan skin score > 14
				<td><center><form:checkbox path="modifiedRodnan" value="1" style="margin-left:15px;"/>1
				<td>Assessment of skin thickness on a scale from 0(normal thickness) to 3+ (severe thickness at 17 anatomic areas (values from 0-51)
				</tr>
				
				<tr>
				<td>Scleredema
				<td><center><form:checkbox path="scleredema" value="0.5" style="margin-left:15px;"/>0.5
				<td>Increase in soft tissue mass (particularly at the fingers) due to dermal imbition and abolishment of skin contours and skin folds
				</tr>
				
				<td>Skin
				<td><center><form:checkbox path="skin" value="2" style="margin-left:15px;"/>2
				<td>The patient states "worsened" in response to the physician's question "Did your skin manifestations change during the last month?"
				</tr>
				
				<tr>
				<td>Digital necrosis
				<td><center><form:checkbox path="digitalNecrosis" value="0.5" style="margin-left:15px;"/>0.5
				<td>Active digital ulcers ranging from small infarcts of the digital tips to digital gangrene
				</tr>
				
				<tr>
				<td>Vascular
				<td><center><form:checkbox path="vascular" value="0.5" style="margin-left:15px;"/>0.5
				<td>The patient states "worsened" in response to the physician't question "Did your blood floow manifestation change during the last month?"
				</tr>
				
				<tr>
				<td>Arthritis
				<td><center><form:checkbox path="arthritis" value="0.5" style="margin-left:15px;"/>0.5
				<td>Symmetric swelling and tenderness of the peripheral joints
				</tr>
				
				<tr>
				<td>DLCO
				<td><center><form:checkbox path="dlco" value="0.5" style="margin-left:15px;"/>0.5
				<td>DLCO less than 80% of the predicted values evaluated by the single breath method
				</tr>
				
				<tr>
				<td>Heart/Lung
				<td><center><form:checkbox path="heartLung" value="2" style="margin-left:15px;"/>2
				<td>The patient states "worsened" in response to the physician's question "Did your cardiopulmonary manifestations change during the last month?"
				</tr>
				
				<tr>
				<td>ESR > 30
				<td><center><form:checkbox path="ESR" value="1.5" style="margin-left:15px;"/>1.5
				<td>Westergreen method
				</tr>
				
				<td>Hypocomplementemia
				<td><center><form:checkbox path="hypocomplementemia" value="1" style="margin-left:15px;"/>1
				<td>Either low C3 or low C4 by whatever method (nephelometry, double radial immuno-diffusion)
				</tr>
				
				</table><br><br>

				<ul>
				<li>*The disease is considered active if the sum of the scores of detected items is > or equal to 3
<br>
				<li>**Articular and/or periarticular inflammatory process due to deposition of subcutaneous hydroxyapatite crystals are excluded.
<br>
				<li>***Carbon monoxide diffusing capacity
				</ul><br><br>
				

				
					
			
			
			</div>
				
				
			
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Save" class="btnSave"></span></li>
					<a href="eustar_table.it?id=${patient.getId() }"><span class="btn"><input type="button"
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