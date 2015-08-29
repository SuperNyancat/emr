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

<form>
<h4 style="text-align:center; font-size:13px;">UNIVERSITY OF SANTO TOMAS HOSPITAL<br>Espanya Blvd., Manila 1015<br>Tel. Nos. 731-3001 to 29; http://www.usthospital.com.ph<br>DEPARTMENT OF CLINICAL PATHOLOGY</h4>
<h4 style="text-align:center; font-size:11px;">LABORATORY REQUEST</h4>
<table style="font-size:9px">
	<tr>
		<td width="500px"><label><b>Patient Name:</b> <u>${patient.getPersonInfo().getFirstName() } ${patient.getPersonInfo().getLastName() }</u></label></td>
		<td><label><b>Date Requested:</b> <u>${patient.getPersonInfo().getRevisionHistory().getDateCreated() }</u></label></td>
	</tr>

	<tr>
		<td width="500px"><label><b>Bed Number:</b> <u>${form.getBedNumber() }</u></label>&nbsp;<label><b>Date of Birth:</b> <u>August 10, 1995</u></label>&nbsp;<label><b>Age:</b> <u>20</u></label>&nbsp;<label><b>Gender:</b> <u>Male</u></label></td>	
		<td><label><b>Prepared by:</b> <u>Dr. ${doctor.getPersonInfo().getFirstName() } ${doctor.getPersonInfo().getLastName() } ${doctor.getSuffix() }</u></label></td>
	</tr>

	<tr>
		<td width="500px"><label><b>Requesting Physician:</b> <u>Dr. ${doctor.getPersonInfo().getFirstName() } ${doctor.getPersonInfo().getLastName() } ${doctor.getSuffix() }</u></label></td>
		<td><label><b>Admission No.:</b> <u> ${form.getAdmissionNumber() }</u></label></td>
	</tr>
	
	<tr>
		<td width="500px"><label><b>Clinical/Pathologic Diagnosis:</b> <u>${form.getDiagnosis() }</u></label></td>
		<td><label><b>Hospital No.:</b> <u>${form.getHospitalNumber() }</u></label></td>
	</tr>
	
	<tr>
		<td><label><b>Specimen:</b> <u>${form.getSpecimen() }</u></label></td>
	</tr>
</table>

<table style="font-size:9px">
<tr>
<c:if test="${fn:length(form.getHematology()) > 0}">							
					<th>
						<label class="bigfont"><h4>HEMATOLOGY</h4></label>
								<ul>
									<c:forEach items="${form.getHematology() }" var="f">
									<li>
										${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									</li>
									</c:forEach><br>		
								</ul>
								</c:if>
						<c:if test="${fn:length(form.getUrineExamination()) > 0 && fn:length(form.getStoolExamination()) > 0}">	
								
						<label class="bigfont"><h4>CLINICAL MICROSCOPY</h4></label>
								<c:if test="${fn:length(form.getUrineExamination()) > 0}">						
								<h3>&nbsp&nbsp&nbsp <u>Urine Examination</u></h3>
									<ul>
									<c:forEach items="${form.getUrineExamination() }" var="f">
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										</li>
										</c:forEach>
									</ul>
								</c:if>	
																
								<c:if test="${fn:length(form.getStoolExamination()) > 0}">	
								<h3>&nbsp&nbsp&nbsp <u>Stool Examination</u></h3>
									<ul>
									<c:forEach items="${form.getStoolExamination() }" var="f">
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										</li>
										</c:forEach>
									</ul>
							</c:if>
								</c:if>
								
													<c:if test="${fn:length(form.getCultureOnly()) > 0 && fn:length(form.getOthers()) > 0 && fn:length(form.getMtbBactec()) > 0 &&  fn:length(form.getStainingProcedures()) > 0 && fn:length(form.getCultureAndSensitivity()) > 0 &&fn:length(form.getSensitivityTestOnly()) > 0}">	
								
							<c:if test="${fn:length(form.getCultureOnly()) > 0}">	
						<label class="bigfont">MICROBIOLOGY</label>
								<h3>&nbsp&nbsp&nbsp <u>Culture Only</u></h3>	
									<ul>	
									<c:forEach items="${form.getCultureOnly() }" var="f">
			
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li>
									</c:forEach> </ul>
								</c:if>
								
								
								
							<c:if test="${fn:length(form.getSensitivityTestOnly()) > 0}">	
							<h3>&nbsp&nbsp&nbsp <u>Sensitivity Test Only</u></h3>	
									<ul>	
									<c:forEach items="${form.getSensitivityTestOnly() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li>
									</c:forEach> </ul>
								</c:if>
								
								
								
							<c:if test="${fn:length(form.getCultureAndSensitivity()) > 0}">	
							<h3>&nbsp&nbsp&nbsp <u>Culture&nbspand&nbspSensitivity</u></h3>	
									<ul>	
									<c:forEach items="${form.getCultureAndSensitivity() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li>
									</c:forEach> </ul>
									</c:if>
								
								
									
									
							<c:if test="${fn:length(form.getMtbBactec()) > 0}">	
							<h3>&nbsp&nbsp&nbsp <u>MTB BACTEC</u></h3>	
									<ul>	
									<c:forEach items="${form.getMtbBactec() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li>
									</c:forEach> </ul>
									</c:if>
								
								
									
									
							<c:if test="${fn:length(form.getStainingProcedures()) > 0}">	
							<h3>&nbsp&nbsp&nbsp <u>Staining Procedures</u></h3>	
									<ul>	
									<c:forEach items="${form.getStainingProcedures() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li>
										<li>
									</c:forEach> </ul>
								</c:if>
								
								
								
							<c:if test="${fn:length(form.getOthers()) > 0}">	
							<h3>&nbsp&nbsp&nbsp <u>Others</u></h3>	
									<ul>	
									<c:forEach items="${form.getOthers() }" var="f">
										
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${f} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											</li>
										</c:forEach> </ul>
								</c:if>
						</c:if>
					</th>
								
								
					<th style="padding-bottom:245px">
								<c:if test="${fn:length(form.getClinicalChemistry()) > 0}">	
						<label class="bigfont"><h4>CLINICAL CHEMISTRY</h4></label>
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
					</th>

					<th>
								<c:if test="${fn:length(form.getCoagulationTests()) > 0 && fn:length(form.getLatexOrRoutineTests()) > 0 && fn:length(form.getTumorMarkers()) > 0}">											
						<label class="bigfont"><h4>IMMUNOCHEMISTRY AND MOLECULAR BIOLOGY</h4></label>
							
															
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
									</c:forEach> </ul></th>
								</c:if>
					
					</th>
					
					<th style="padding-bottom:185px">
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
					</th>
</tr>																				
</table>	
							<c:if test="${fn:length(form.getOthersTextArea()) > 0}">
							<label class="bigfont"><h4>OTHERS:</h4></label> ${form.getOthersTextArea()}<br><br>
						</c:if>
</form>		
<br><br><br><br>


</body>
</html>