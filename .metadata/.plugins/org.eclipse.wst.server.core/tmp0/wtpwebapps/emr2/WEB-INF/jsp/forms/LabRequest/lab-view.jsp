<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>Laboratory Request</title>
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
		<form:form commandName="form" action="lab_request_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="edit_lab_request.it" method="GET">
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
			<form:form commandName="form" action="delete_lab.it" method="GET">
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
						<form>
							<p class="titles">Laboratory Request</p> <br/><br/><br/><br/>
								<ul>
									<li>
										Patient Name: ${patient.getPersonInfo().getFirstName() }  ${patient.getPersonInfo().getLastName()}
										Bed Number: ${form.getBedNumber() }
									</li><br>	
									<li>
										Admission Number: ${form.getAdmissionNumber() }&nbsp&nbsp&nbsp&nbsp&nbsp 
										Hospital Number: ${form.getHospitalNumber() }&nbsp&nbsp&nbsp&nbsp&nbsp 
									</li><br>
									<li>
										Diagnosis: ${form.getDiagnosis() }&nbsp&nbsp&nbsp&nbsp&nbsp 
										Specimen: ${form.getSpecimen() }&nbsp&nbsp&nbsp&nbsp&nbsp
									</li><br>
								</ul>
							
							
							<c:if test="${fn:length(form.getHematology()) > 0}">	
						
							<label class="bigfont"><h4>HEMATOLOGY</h4></label><br><br>	
								<ul>
									<c:forEach items="${form.getHematology() }" var="f">
									<li>
										${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									</li>
									</c:forEach><br>		
								</ul>
								</c:if>
								
								
							<c:if test="${fn:length(form.getStoolExamination()) > 0 && fn:length(form.getStoolExamination()) > 0}">	
								
						<label class="bigfont"><h4>CLINICAL MICROSCOPY</h4></label><br><br>
									<c:if test="${fn:length(form.getUrineExamination()) > 0}">	
						
								<h3>&nbsp&nbsp&nbsp <u>Urine Examination</u></h3>
									<ul>
									<c:forEach items="${form.getUrineExamination() }" var="f">
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										</li><br>
										</c:forEach>
									</ul>
								</c:if>	
								
								
								
							<c:if test="${fn:length(form.getStoolExamination()) > 0}">	
							<h3>&nbsp&nbsp&nbsp <u>Stool Examination</u></h3>
									<ul>
										<c:forEach items="${form.getStoolExamination() }" var="f">
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										</li><br>
										</c:forEach>
									</ul>
							</c:if>
								</c:if>
								
								
								
							<c:if test="${fn:length(form.getCultureOnly()) > 0 && fn:length(form.getOthers()) > 0 && fn:length(form.getMtbBactec()) > 0 &&  fn:length(form.getStainingProcedures()) > 0 && fn:length(form.getCultureAndSensitivity()) > 0 &&fn:length(form.getSensitivityTestOnly()) > 0}">	
								
							<c:if test="${fn:length(form.getCultureOnly()) > 0}">	
						<label class="bigfont">MICROBIOLOGY</label><br><br>
								<h3>&nbsp&nbsp&nbsp <u>Culture Only</u></h3>	
									<ul>	
									<c:forEach items="${form.getCultureOnly() }" var="f">
			
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li><br>
									</c:forEach> </ul>
								</c:if>
								
								
								
							<c:if test="${fn:length(form.getSensitivityTestOnly()) > 0}">	
							<h3>&nbsp&nbsp&nbsp <u>Sensitivity Test Only</u></h3>	
									<ul>	
									<c:forEach items="${form.getSensitivityTestOnly() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li><br>
									</c:forEach> </ul>
								</c:if>
								
								
								
							<c:if test="${fn:length(form.getCultureAndSensitivity()) > 0}">	
							<h3>&nbsp&nbsp&nbsp <u>Culture and Sensitivity</u></h3>	
									<ul>	
									<c:forEach items="${form.getCultureAndSensitivity() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li><br>
									</c:forEach> </ul>
									</c:if>
								
								
									
									
							<c:if test="${fn:length(form.getMtbBactec()) > 0}">	
							<h3>&nbsp&nbsp&nbsp <u>MTB BACTEC</u></h3>	
									<ul>	
									<c:forEach items="${form.getMtbBactec() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li><br>
									</c:forEach> </ul>
									</c:if>
								
								
									
									
							<c:if test="${fn:length(form.getStainingProcedures()) > 0}">	
							<h3>&nbsp&nbsp&nbsp <u>Staining Procedures</u></h3>	
									<ul>	
									<c:forEach items="${form.getStainingProcedures() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li><br>
										<li>
									</c:forEach> </ul>
								</c:if>
								
								
								
							<c:if test="${fn:length(form.getOthers()) > 0}">	
							<h3>&nbsp&nbsp&nbsp <u>Others</u></h3>	
									<ul>	
									<c:forEach items="${form.getOthers() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li><br>
										</c:forEach> </ul>
								</c:if>
						</c:if>
						
								
								
							<c:if test="${fn:length(form.getClinicalChemistry()) > 0}">	
						<label class="bigfont"><h4>CLINICAL CHEMISTRY</h4></label><br><br>
								<ul>
								<c:forEach items="${form.getClinicalChemistry() }" var="f">
										
									<li>
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										</li><br>
								</c:forEach> </ul>
								</c:if>
								
								
															
						<c:if test="${fn:length(form.getUrineChemistry()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Urine Chemistry</u></h3>	
								
									<ul>	
										<li> Duration: ${form.getUrineChemDuration() }
										</li>
									<c:forEach items="${form.getUrineChemistry() }" var="f">
										
										<li>
												&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										</li><br>
									</c:forEach> </ul>
									</c:if>
								
								
															
						<c:if test="${fn:length(form.getTransudateAndExudate()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Transudate and Exudate</u></h3>	
									<ul>	
									<c:forEach items="${form.getTransudateAndExudate() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li><br>
									</c:forEach> </ul>
								</c:if>
								
								
															
						<c:if test="${fn:length(form.getSpecialBloodChemistry()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Special Blood Chemistry</u></h3>	
									<ul>	
									<c:forEach items="${form.getSpecialBloodChemistry() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										</li><br>
									</c:forEach> </ul>
							</c:if>
								
								
							
							
			<c:if test="${fn:length(form.getCoagulationTests()) > 0 && fn:length(form.getLatexOrRoutineTests()) > 0 && fn:length(form.getTumorMarkers()) > 0}">	
											
							<label class="bigfont"><h4>IMMUNOCHEMISTRY AND MOLECULAR BIOLOGY</h4></label><br><br>
							
															
							<c:if test="${fn:length(form.getCoagulationTests()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Coagulation Tests</u></h3>	
									<ul>	
									<c:forEach items="${form.getCoagulationTests() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li><br>
										</c:forEach> </ul>
							</c:if>
								
								
															
						<c:if test="${fn:length(form.getLatexOrRoutineTests()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Latex/Routine Tests</u></h3>	
									<ul>	
									<c:forEach items="${form.getLatexOrRoutineTests() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li><br>
									</c:forEach> </ul>
									</c:if>
								
								
															
							<c:if test="${fn:length(form.getTumorMarkers()) > 0}">	
							<h3>&nbsp&nbsp&nbsp <u>Tumor Markers</u></h3>	
									<ul>	
									<c:forEach items="${form.getTumorMarkers() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li><br>
									</c:forEach> </ul>
							</c:if>
					</c:if>
					
								
															
						<c:if test="${fn:length(form.getHepatitisMarkers()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Hepatitis Markers</u></h3>	
									<ul>	
									<c:forEach items="${form.getHepatitisMarkers() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									</li><br>
										</c:forEach> </ul>
									</c:if>
								
								
															
						<c:if test="${fn:length(form.getAnemiaPanel()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Anemia Panel</u></h3>	
									<ul>	
									<c:forEach items="${form.getAnemiaPanel() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										</li><br>
									</c:forEach> </ul>
								</c:if>
								
									
															
						<c:if test="${fn:length(form.getReproductiveTests()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Reproductive Tests</u></h3>	
									<ul>	
									<c:forEach items="${form.getReproductiveTests() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li><br>
										</c:forEach> </ul>
								</c:if>
								
								
															
						<c:if test="${fn:length(form.getProhibitedDrugTesting()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Prohibited Drug Testing</u></h3>	
									<ul>	
									<c:forEach items="${form.getProhibitedDrugTesting() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										</li><br>
									</c:forEach> </ul>
								</c:if>
								
															
						<c:if test="${fn:length(form.getPolymerseChainReaction()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Polymerase Chain Reaction</u></h3>	
									<ul>	
									<c:forEach items="${form.getPolymerseChainReaction() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li><br>
									</c:forEach> </ul>
								</c:if>
								
															
						<c:if test="${fn:length(form.getAutoimmuneTests()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Autoimmune Tests</u></h3>	
									<ul>	
									<c:forEach items="${form.getAutoimmuneTests() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										</li><br>	
									</c:forEach> </ul>	
									</c:if>
								
									
															
						<c:if test="${fn:length(form.getEndocrineTests()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Endocrine Tests</u></h3>	
									<ul>	
									<c:forEach items="${form.getEndocrineTests() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										</li><br>
									</c:forEach> </ul>
									</c:if>
								
															
						<c:if test="${fn:length(form.getElectrophoresis()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Electrophoresis</u></h3>	
									<ul>	
									<c:forEach items="${form.getElectrophoresis() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										</li><br>
									</c:forEach> </ul>
									</c:if>
								
															
						<c:if test="${fn:length(form.getFlowCytometry()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Flow Cytometry</u></h3>	
									<ul>	
									<c:forEach items="${form.getFlowCytometry() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										</li><br>
										</c:forEach> </ul>
								</c:if>
								
															
						<c:if test="${fn:length(form.getInfectiousDiseases()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Infectious Diseases</u></h3>	
									<ul>	
									<c:forEach items="${form.getInfectiousDiseases() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										</li><br>
									</c:forEach> </ul>
							</c:if>
							
							<c:if test="${fn:length(form.getOthersTextArea()) > 0}">
							<label class="bigfont"><h4>OTHERS:</h4></label> ${form.getOthersTextArea()}<br><br>
						</c:if>
								<div>
								</div>
								
						
								<ul class="ctrlBtn listSpace">
									<li><span class="btn"><a href="print.it?pid=${patient.getId() }&fid=${form.getId()}"><input type="button" value="Print" class="btnEdit" style="right-align"></a></span></li>
								</ul>
						</form>		
					</div>
				</section>
			</div>
		</div>
	</div>		
</div>
		
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>
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