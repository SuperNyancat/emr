<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<style>
		table, td {
			border: 1px solid gray;
			border-collapse: collapse;
		}
		td {
			padding: 5px;
			text-align: left;
		}
	</style>
	

</head>

<body>

<div id="wrap">

		<jsp:include page="../../headers/doctor-header.jsp">
			<jsp:param name="title" value="View Physician's Assessment" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>


<div class="pageCtrl">
<ul class="ctrlBtn">
	<li><span class="btn">
		<form:form commandName="form" action="ped_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="ped_edit.it" method="GET">
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
			<form:form commandName="form" action="ped_delete.it" method="GET">
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
	<div class="wrapper">	
		<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
			<jsp:param name="selected" value="forms" />
			</jsp:include>
		
			<div class="tab-content">
				<div id="History" class="tab active">           
					<section class="settingBody clrfix">		
						<div class = "left">
							<jsp:include page="../../headers/patient-left.jsp" />
						</div>
			
					<div class="right">
							<p class="titles">Physician's Assessment</p><br>
								<p align="center"><i>0 - ABSENT 1 - PRESENT</i></p>
								<table border="1px" class="navigation" style="margin:0px auto;">
								<tr>
									<th colspan="4" align="center"><b>PATIENT RIGHT</b></th>
									<th colspan="4" align="center"><b>PATIENT LEFT</b></th>
								</tr>
												<tr>
									<th>Joint</th>
									<th align="center">Pain</th>
									<th align="center">Swelling</th>
									
									<th>Joint</th>
									<th align="center">Pain</th>
									<th align="center">Swelling</th>									
								</tr>
								<c:forEach varStatus="i" begin="0" end="${fn:length(form.joint)-1 }" >
									<c:choose>
										<c:when test="${i.index % 2 == 0 }">
										<tr>
											<td>${form.joint[i.index].jointName } ${form.joint[i.index].side }</td>
											<td align="center">
												<c:choose>
														<c:when test="${form.joint[i.index].pain == true }">
															<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
														</c:when>
														<c:otherwise>
															<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
														</c:otherwise>
													</c:choose>									
											</td>
											<td align="center">
												<c:choose>
													<c:when test="${form.joint[i.index].swelling == true }">
														<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
														
													</c:when>
													<c:otherwise>
														<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
														
													</c:otherwise>
												</c:choose>
											</td>
										</c:when>
									
										<c:otherwise>
											<td>${form.joint[i.index].jointName } ${form.joint[i.index].side }</td>
											<td align="center">
												<c:choose>
														<c:when test="${form.joint[i.index].pain == true }">
															<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
														</c:when>
														<c:otherwise>
															<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
														</c:otherwise>
													</c:choose>
											</td>
											<td align="center">
													<c:choose>
														<c:when test="${form.joint[i.index].swelling == true }">
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
								<br><br>
								<p align="center">Physician’s Global Assessment (from very good to very bad): <b>${form.getPGA()}</b></p><br><br>					
				
				<table border="1" class="navigation" style="margin:0px auto;">
					<tr>
						<th></th>
						<th>Today's Score</th>
						<th>Baseline</th>
						<th>Percentage Change</th>
					</tr>
					<tr>
						<th>Physician Global<br>Assessment Score</th>
						<td>${form.getPGA_today()}</td>
						<td>${form.getPGA_baseline()}</td>
						<td>${form.getPGA_percent()}</td>
					</tr>
					
					<tr>
						<th>Painful Joints</th>
						<td>${form.getPainfulJoints_today()}</td>
						<td>${form.getPainfulJoints_baseline()}</td>
						<td>${form.getPainfulJoints_percent()}</td>
					</tr>

					<tr>
						<th>Swollen Joints</th>
						<td>${form.getSwollenJoints_today()}</td>
						<td>${form.getSwollenJoints_baseline()}</td>
						<td>${form.getSwollenJoints_percent()}</td>
					</tr>

					<tr>
						<th>Acute-Phase Reactant:<br>ESR or CRP</th>
						<td>${form.getESR_today()}</td>
						<td>${forn.getESR_baseline()}</td>
						<td>${form.getESR_percent()}</td>
					</tr>								
				</table>
				
				<br><br>
				<p style="color:goldenrod;"><b>Scores From Patient Assessment</b></p>
									
				<table border="1" class="navigation" style="margin:0px auto;">
					<tr>
						<th></th>
						<th>Today's Score</th>
						<th>Baseline</th>						
						<th>Percentage Change</th>
					</tr>
					<tr>
						<td>Function (FN) Index</td>
						<td>${form.FN_today }</td>
						<td>${form.FN_baseline}</td>
						<td>${form.getFN_percent()}</td>
					</tr>
					
					<tr>
						<td>Patient Pain (PN) Score</td>
						<td>${form.PN_today }</td>
						<td>${form.PN_baseline}</td>
						<td>${form.getPN_percent()}</td>
					</tr>

					<tr>
						<td>Patient Global (GL) Score</td>
						<td>${form.GL_today }</td>
						<td>${form.GL_baseline}</td>
						<td>${form.getGL_percent()}</td>
					</tr>							
				</table>		
				

				<br><br>
			<p style="color:goldenrod;"><b>Criteria for ACR 20 Improvement</b></p>				
			<table border="1" class="navigation" style="margin:0px auto;">
				<tr>
					<th>Required</th>
					<th>Achieved</th>
				</tr>
				<tr>
					<td>> 20% Improvement in painful joint count</td>
					<td>
						<c:choose>
							<c:when test="${form.painfulJoint_improvement == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
							</c:when>
							<c:otherwise>
								<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>> 20% Improvement in swollen joint count</td>
					<td>
						<c:choose>
							<c:when test="${form.swollenJoint_improvement == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
							</c:when>
							<c:otherwise>
								<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td> + </td>
					<td></td>
				</tr>
				<tr>
					<td>> 20% Improvement in 3 of the following 5 areas</td>
					<td>
						<c:choose>
							<c:when test="${form.ACR20 == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
							</c:when>
							<c:otherwise>
								<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>Patient Pain Assessment (PN)</td>
					<td>
						<c:choose>
							<c:when test="${form.PN_improvement == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
							</c:when>
							<c:otherwise>
								<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>Patient Global Assessment (GL)</td>
					<td>
						<c:choose>
							<c:when test="${form.GL_improvement == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
							</c:when>
							<c:otherwise>
								<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>Physician Global Assessment</td>
					<td>
						<c:choose>
							<c:when test="${form.PGA_improvement == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
							</c:when>
							<c:otherwise>
								<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>Patient Self-Assessed Disability (FN)</td>
					<td>
						<c:choose>
							<c:when test="${form.FN_improvement == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
							</c:when>
							<c:otherwise>
								<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>Acute-Phase Reactant (ESR or CRP)</td>
					<td>
						<c:choose>
							<c:when test="${form.ESR_improvement == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;">
							</c:when>
							<c:otherwise>
								<img src="resources/images/x.png" alt="" style="width:20px; height:20px;">
							</c:otherwise>
						</c:choose>
					</td>
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
<script>
	function showDiv() {
   document.getElementById('welcomeDiv').style.display = "block";
	}

	function hideDiv() {
   document.getElementById('welcomeDiv').style.display = "none";
	}
</script>
</body>
</html>