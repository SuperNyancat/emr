<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>View CDAI Form</title>
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
		<form:form commandName="form" action="cdai_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="cdai_edit.it" method="GET">
			<form:hidden path="patient.id" value="${patient.id }" />
			<form:hidden path="id" value="${form.id }" />
			<input type="submit" value="Edit" class="btnEdit" />
		</form:form>
	</span></li>
	<li><span class="btn"><input type="button" name="answer" value="Delete" onclick="showDiv()" class="btnDel"/></span></li>			
</ul>

	<div align="center" id="welcomeDiv"  style="display:none; background:red; padding-left:20px" class="answer_list" >
		<p style="color:white; font-size:15px; padding-top:10px;">Are you sure you want to delete?</p><br>
		<span class="btn">
			<form:form commandName="form" action="cdai_delete.it" method="GET">
				<form:hidden path="patient.id" value="${patient.id }" />
				<form:hidden path="id" value="${form.id }" />
				<input type="submit" value="OK" class="btnDel"/>
			</form:form>	
		</span>
		<span class="btn"><input type="button" value="Cancel" onclick="hideDiv()" class="btnCancel"/></span>
		<br>
	</div>
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
								<br><p class="titles" style="color:goldenrod">Clinical Disease Activity Index</p><br>		
							</div>
							<br><br>	

									<p align="center"><i>0 - Absent 1 - Present</i></p>
									<table border="1" class="navigation" style="margin:0px auto;">
									<tr>
										<td></td>
										<td colspan="2" style="text-align:center"><b>Left</b></td>
										<td colspan="2" style="text-align:center"><b>Right</b></td>
									</tr>
									
									<tr>
										<td><b>Joint</b></td>
										<td style="text-align:center"><b>Tender</b></td>
										<td style="text-align:center"><b>Swollen</b></td>
										<td style="text-align:center"><b>Tender</b></td>
										<td style="text-align:center"><b>Swollen</b></td>
									</tr>
			<c:forEach varStatus="i" begin="0" end="${fn:length(form.joints)-1 }" >
			
			<c:choose>
				<c:when test="${i.index % 2 == 0 }">
				<tr>
					<td>${form.joints[i.index].jointName } ${form.joints[i.index].side }</td>
					<td align="center">
						<c:choose>
								<c:when test="${form.joints[i.index].pain == true }">
									<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
								</c:when>
								<c:otherwise>
									<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
								</c:otherwise>
							</c:choose>									
					</td>
					<td align="center">
						<c:choose>
							<c:when test="${form.joints[i.index].swelling == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
								
							</c:when>
							<c:otherwise>
								<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
								
							</c:otherwise>
						</c:choose>
					</td>
				</c:when>
				
				
				
					
				<c:otherwise>
					<td>${form.joints[i.index].jointName } ${form.joints[i.index].side }</td>
					<td align="center">
						<c:choose>
								<c:when test="${form.joints[i.index].pain == true }">
									<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
								</c:when>
								<c:otherwise>
									<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
								</c:otherwise>
							</c:choose>
					</td>
					<td align="center">
						<c:choose>
								<c:when test="${form.joints[i.index].swelling == true }">
									<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
								</c:when>
								<c:otherwise>
									<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
								</c:otherwise>
							</c:choose>
					</td>								
				</tr>
				</c:otherwise>
			</c:choose>
				
							
									
												
					
			</c:forEach>	
									
									<tr>
										<td><b>Total</b></td>
										<td colspan="2" style="text-align:center"><b>Tender: </b> ${form.tenderScore }</td>
										<td colspan="2" style="text-align:center"><b>Swollen: </b> ${form.swollenScore }</td>
									</tr>									
									</table>
									<br><br>
									
									<table border="1px" class="navigation" style="margin:0px auto;">
									<tr>
										<td></td>
										<td><b>Score</td>
									</tr>
									
									<tr>
										<td><b>Patient Global Assessment of Disease Activity</td>
										<td>${form.patientGlobalAssessment }</td>
									</tr>	

									<tr>
										<td><b>Provider Global Assessment of Disease Activity</td>
										<td>${form.providerGlobalAssessment }</td>
									</tr>										
									</table>
									<br><br>
									
									<table border="1px" class="navigation" style="margin:0px auto;">
									<tr>
										<td colspan="3" style="text-align:center">How to score the CDAI</td>	
									</tr>
									
									<tr>
										<td><b>Variable</b></td>										
										<td><b>Range</b></td>										
										<td><b>Value</b></td>										
									</tr>
									
									<tr>
										<td>Tender joint score</td>
										<td>(0-28)</td>
										<td style="text-align:center">${form.tenderScore }</td>
									</tr>
									
									<tr>
										<td>Swollen joint score</td>
										<td>(0-28)</td>
										<td style="text-align:center">${form.swollenScore }</td>
									</tr>

									<tr>
										<td>Patient global score</td>
										<td>(0-10)</td>
										<td style="text-align:center">${form.patientGlobalAssessment }</td>
									</tr>

									<tr>
										<td>Provider global score</td>
										<td>(0-10)</td>
										<td style="text-align:center">${form.providerGlobalAssessment }</td>
									</tr>

									<tr>
										<td><b>Add the above values to calculate the CDAI score</b></td>
										<td>(0-76)</td>
										<td style="text-align:center">${form.CDAIScore }</td>
									</tr>		
									<tr>
										<td><b>CDAI Interpretation</b></td>
										<td></td>
										<td style="text-align:center">${form.CDAIScoreInterpretation }</td>
									</tr>							
									</table>	
									<br><br>									
									
									<table border="1px" class="navigation" style="margin:0px auto;">
									<tr>
										<td colspan="2"><b>CDAI Score Interpretation</b></td>
									</tr>
									
									<tr>
										<td>0.0 – 2.8</td>
										<td>Remission</td>
									</tr>
									
									<tr>
										<td>2.9 – 10.0</td>
										<td>Low Activity</td>
									</tr>

									<tr>
										<td>10.1 – 22.0</td>
										<td>Moderate Activity</td>
									</tr>

									<tr>
										<td>22.1 – 76.0</td>
										<td>High Activity</td>
									</tr>									
									</table>
									<br><br>
									<br>
									<br>
							
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
		</form>
		
	</div>
	
		
</div>
	
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>
</div>
</body>
</html>