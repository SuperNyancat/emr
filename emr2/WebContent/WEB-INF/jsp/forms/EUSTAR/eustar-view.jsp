<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>View EUSTAR Form</title>
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
		<form:form commandName="form" action="eustar_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="eustar_edit.it" method="GET">
			<form:hidden path="patient.id" value="${patient.id }" />
			<form:hidden path="id" value="${form.id }" />
			<input type="submit" value="Edit" class="btnEdit" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="eustar_delete.it" method="GET">
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
				
				
				<div class="right">
				<p class="titles">EUSTAR Systemic Sclerosis Activity Score</p><br>	
				
				<table border="1px;">
				<tr>
				<th style="width:300px;">Parameter</th>
				<th style="width:100px;">Score</th>
				<th style="width:300px;">Asessment</th>
				</tr>
				
				<tr>
				<td>Modified Rodnan skin score > 14
				<td><center><c:choose><c:when  test="${fn:length(form.modifiedRodnan) >0 }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>1
				<td>Assessment of skin thickness on a scale from 0(normal thickness) to 3+ (severe thickness at 17 anatomic areas (values from 0-51)
				</tr>
				
				<tr>
				<td>Scleredema
				<td><center><c:choose><c:when  test="${fn:length(form.scleredema) > 0}">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>0.5
				<td>Increase in soft tissue mass (particularly at the fingers) due to dermal imbition and abolishment of skin contours and skin folds
				</tr>
				
				<td>Skin
				<td><center><c:choose><c:when  test="${fn:length(form.skin) > 0}">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>2
				<td>The patient states "worsened" in response to the physician's question "Did your skin manifestations change during the last month?"
				</tr>
				
				<tr>
				<td>Digital necrosis
				<td><center><c:choose><c:when  test="${fn:length(form.digitalNecrosis) > 0}">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>0.5
				<td>Active digital ulcers ranging from small infarcts of the digital tips to digital gangrene
				</tr>
				
				<tr>
				<td>Vascular
				<td><center><c:choose><c:when test="${fn:length(form.vascular) > 0}">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>0.5
				<td>The patient states "worsened" in response to the physician't question "Did your blood floow manifestation change during the last month?"
				</tr>
				
				<tr>
				<td>Arthritis
				<td><center><c:choose><c:when  test="${fn:length(form.arthritis) > 0}">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>0.5
				<td>Symmetric swelling and tenderness of the peripheral joints
				</tr>
				
				<tr>
				<td>DLCO
				<td><center><c:choose><c:when  test="${fn:length(form.dlco) > 0}">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>0.5
				<td>DLCO less than 80% of the predicted values evaluated by the single breath method
				</tr>
				
				<tr>
				<td>Heart/Lung
				<td><center><c:choose><c:when  test="${fn:length(form.heartLung) > 0}">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>2
				<td>The patient states "worsened" in response to the physician's question "Did your cardiopulmonary manifestations change during the last month?"
				</tr>
				
				<tr>
				<td>ESR > 30
				<td><center><c:choose><c:when  test="${fn:length(form.ESR) > 0}">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>1.5
				<td>Westergreen method
				</tr>
				
				<td>Hypocomplementemia
				<td><center><c:choose><c:when  test="${fn:length(form.hypocomplementemia) > 0}">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>1
				<td>Either low C3 or low C4 by whatever method (nephelometry, double radial immuno-diffusion)
				</tr>
				
				<tr>
					<td>Total Score</td>
					<td><center><h3>${form.score }</h3></center></td>
					<td></td>
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