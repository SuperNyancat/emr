<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>View DAS28 Form</title>
	<meta charset="utf-8">
	<style>
		table, td, th {
			border: 1px solid gray;
			border-collapse: collapse;
		}
		td {
			padding: 6px;
			text-align: left;
		}
	</style>
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
		<form:form commandName="form" action="das_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="das_edit.it" method="GET">
			<form:hidden path="patient.id" value="${patient.id }" />
			<form:hidden path="id" value="${form.id }" />
			<input type="submit" value="Edit" class="btnEdit" />
		</form:form>
	<li><span class="btn"><input type="button" name="answer" value="Delete" onclick="showDiv()" class="btnDel"/></span></li>			
</ul>

	<div align="center" id="welcomeDiv"  style="display:none; background:red; padding-left:20px" class="answer_list" >
		<p style="color:white; font-size:15px; padding-top:10px;">Are you sure you want to delete?</p><br>
		<span class="btn">
			<form:form commandName="form" action="das_delete.it" method="GET">
				<form:hidden path="patient.id" value="${patient.id }" />
				<form:hidden path="id" value="${form.id }" />
				<input type="submit" value="OK" class="btnDel"/>
			</form:form>	
		</span>
		<span class="btn"><input type="button" value="Cancel" onclick="hideDiv()" class="btnCancel"/></span>
		<br>
	</div>	
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
					<div>
						<br><p class="titles" style="color:goldenrod">Disease Activity Score in 28 Joints (DAS28)</p><br>		
					</div>
					<br><br>
					
					<p align=""><b>Patient's Global Assessment:</b></p><br>
					<p align="center">Mark an X on the line below to indicate disease activity (independent of the patient's self assessment): <br>
						VERY WELL
						&nbsp&nbsp ${form.getPGA()}	
						&nbsp&nbsp VERY POORLY
					</p><br><br>
					<p>
						<b>If Diagnosis is RA:</b>
					<p>
								
					<p>
						&nbsp&nbsp&nbsp&nbsp&nbsp <b>Click the radio button if there is 'none'</b>
					<p>
					<br>
					
					<table border="1px" class="navigation" style="margin:0px auto;" width="400">
						<tr>
							<td></td>
							<th colspan="2" style="font-size:12px;width:400px;"><b>LEFT</b></th>
							<th colspan="2" style="font-size:12px;width:400px;"><b>RIGHT</b></th>
						</tr>	
								
						<tr>
							<td></td>
							<th style="font-size:12px;width:400px;">SWOLLEN</th>
							<th style="font-size:12px;width:400px;">TENDER</th>
							<th style="font-size:12px;width:400px;">SWOLLEN</th>
							<th style="font-size:12px;width:400px;">TENDER</th>
						</tr>	
								
						<c:forEach varStatus="i" begin="0" end="${fn:length(form.joints)-1 }" >
							<c:choose>
								<c:when test="${i.index % 2 == 0 }">
									<tr>
										<td>${form.joints[i.index].jointName } ${form.joints[i.index].side }</td>
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
								</c:when>	
								
								<c:otherwise>
									<td>${form.joints[i.index].jointName } ${form.joints[i.index].side }</td>
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
								</tr>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				
								
					</table>								
					<br>
					
					<p align="center"><b>DAS28</b> = 0.56*&radic;(28TJC) + &radic;(28SJC) + 0.70*Ln(ESR/CRP) + 0.14*VAS</p><br><br>
							
					<p align=""><b>How to calculate a DAS28 score:</b></p><br>
					<p align="">
						1. Ask the patient to make a vertical mark on 100 mm Visual Analog Scale (VAS) corresponding to their general
							health or global disease activity. Using a ruler, measure from the left-hand side in mm. Note: DAS 28 
							calculations may be performed without a VAS measurement.<br><br>
						2. Perform a swollen and tender joint examination on your patient. Add all of the swollen and tender joints and
							record the totals in the appropriate boxes.<br><br>
						3. Erythrocyte Sedimentation Rate(ESR) should be measured (in mm/hour). Note: C-reactive protein (CRP) levels
							maybe used as substitute for an ESR.<br><br>
						4. Plug the appropriate values into the formula (many online calculators are available including
							<br> <a href="http://www.das-score.nl/www.das-score.nl/dasculators.html">http://www.das-score.nl/www.das-score.nl/dasculators.html</a>) <br><br>
						5. If using CRP instead of ESR or calculating a score from only 3 variables please see 
							<br> <a href="http://www.reuma-nijmegen.nl/www.das-score.nl/">http://www.reuma-nijmegen.nl/www.das-score.nl/</a> 
							for the approriate formula. <br><br>
					</p><br><br>
					
					<p align=""><b>Interpretation:</b></p><br>
					<p align="">
						<b>&bull;</b> The DAS28 provides you with a number on a scale from 0 to 10 indicating current RA disease activity.<br><br>
						<b>&bull;</b> Remission: DAS28 <= 2.6<br><br>
						<b>&bull;</b> Low Disease activity: 2.6 < DAS28 <= 3.2<br><br>
						<b>&bull;</b> Moderate Disease Activity: 3.2 < DAS28 <= 5.1<br><br>
						<b>&bull;</b> High Disease Activity: DAS28 > 5.1<br><br>
					</p><br><br>
					
					<table border="1px" class="navigation" style="margin:0px auto;">	
						<tr>
							<td><b>VAS (0-100):</b>  ${form.getVas()}</td>
							<td><b>28TJC:</b>  ${form.getTjc28()}</td>
							<td><b>28SJC:</b>  ${form.getSjc28()}</td>
							<td><b>ESR:</b>  ${form.getEsr()}</td>
						</tr>
						
						<tr>
							<td colspan="4">DAS28:  <strong>${form.getDas28() }</strong></td>
							<tr>
							<td colspan="4">Interpretation: <b>${form.interpretation }</b></td>
						</tr>	
						</tr>							
					</table>								
					<br><br><br>
					
				
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