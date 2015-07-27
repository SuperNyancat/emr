<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Edit Inflammatory Myopathy Flow Sheet</title>
	<meta charset="utf-8">
	
	
</head>

<body>
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
				<div>
				<p class="titles">Inflammatory Myopathy Flow Sheet</p><br><br>
				</div>
				
			<ul>
			<li>
<form:form action="update_inflammatory_myopath_flowsheet.it?pid=${patient.getId()}&fid=${form.getId()}" method="post" commandName="form">
	<form:hidden path="id" value="${form.getId() }"/>
	<form:hidden path="patient.id" value="${patient.getId()}"/>
	<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
	<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
	<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
									

<c:choose>


<c:when test="${previous == null}">
<table class="tablecontent">	
			
			
						<tr>
										
							<th class="navblank">&nbsp;</td>
							<th class="phn">${date}</td>
						</tr>
				
				
						<tr>
							<td class="pro">Weight (kg)</td>
							<td class="phn"><form:input type="text" pattern="\\d+(\\.\\d+)?" path="weight" value="${form.getWeight()}" required="true" /></td>
						</tr>	
						
						<tr class="selected">
							<td class="pro">Blood Pressure</td>
							<td class="phn"><form:input type="text" path="bloodPressure" value="${form.getBloodPressure()}" required="true"  /></td>
						</tr>
			
			
			
			<tr><td><br><h4>Labs/Other Data</h4></td></tr>
						
						<tr>
							<td class="pro">Hgb/Hct</td>
							<td class="phn"><form:input type="text" path="HgbOrHct" value="${form.getHgbOrHct()}" /></td>
						</tr>	
			<tr>
							<td class="pro">WBC/Platelet</td>
							<td class="phn"><form:input type="text" path="WBCOPlatelet" value="${form.getWBCOPlatelet()}" /></td>
						</tr>	
			<tr>
							<td class="pro">ESR</td>
							<td class="phn"><form:input type="text" path="ESR" value="${form.getESR()}" /></td>
						</tr>	
			<tr>
							<td class="pro">ALT/AST</td>
							<td class="phn"><form:input type="text" path="ALTOrAST" value="${form.getALTOrAST()}" /></td>
						</tr>	
			<tr>
							<td class="pro">SLDH</td>
							<td class="phn"><form:input type="text" path="SLDH" value="${form.getSLDH()}" /></td>
						</tr>	
			<tr>
							<td class="pro">TCK/CKMM</td>
							<td class="phn"><form:input type="text" path="TCKorCKMM" value="${form.getTCKorCKMM()}" /></td>
						</tr>	
			
			
						<tr>
							<td class="pro">Other Data</td>
							<td class="phn"><form:textarea path="otherData" class="textareatable" value="${form.getOtherData()}" /></td>		
						</tr>
			
			
				
				<tr><td><br><h4>Clinical Data</h4></td></tr>
			
						<tr>
							<td class="pro"></td>
							<td class="phn"><form:textarea path="clinicalData" class="textareatable" value="${form.getClinicalData()}" required="true" /></td>
						</tr>	
						
			
				<tr><td><br><h4>Self-Assessment</h4></td></tr>
			
						<tr class="selected">
							<td class="pro"></td>
							<td class="phn"><form:textarea path="VAS" class="textareatable" value="${form.getVAS()}" /></li></td>
						</tr>		
			
			
				<tr><td><br><h4>Meds/Plans</h4></td></tr>
						<tr>
							<td class="pro"></td>
							<td class="phn"><form:textarea path="plans" class="textareatable" value="${form.getPlans()}" required="true" /></li></td>		
						</tr>
						
			
					</table>
</c:when>








<c:when test="${previous.size() == 1 }">

	<table class="tablecontent">	
			
			
						<tr>
										
							<th class="navblank">&nbsp;</td>
							<th class="pro">${previous.get(0).getRevisionHistory().getDateCreated() }</td>
							<th class="phn">${date}</td>
						</tr>
					
						<tr>
							<td class="pro">Weight (kg)</td>
							<td class="phn">${previous.get(0).getWeight() }</td>
							<td class="ind"><form:input type="text" path="weight" pattern="\\d+(\\.\\d+)?"  value="${form.getWeight()}" required="true" /></td>
						</tr>	
						
						<tr class="selected">
							<td class="pro">Blood Pressure</td>
							<td class="phn">${previous.get(0).getBloodPressure() }</td>
							<td class="ind"><form:input type="text" path="bloodPressure" value="${form.getBloodPressure()}" required="true" /></td>
						</tr>
			
			
			
			<tr><td><br><h4>Labs/Other Data</h4></td></tr>
						
						<tr>
							<td class="pro">Hgb/Hct</td>
							<td class="phn">${previous.get(0).getHgbOrHct() }</td>
							<td class="ind"><form:input type="text" path="HgbOrHct" value="${form.getHgbOrHct()}" /></td>
						</tr>	
			<tr>
							<td class="pro">WBC/Platelet</td>
							<td class="phn">${previous.get(0).getWBCOPlatelet() }</td>
							<td class="ind"><form:input type="text" path="WBCOPlatelet" value="${form.getWBCOPlatelet()}" /></td>
						</tr>	
			<tr>
							<td class="pro">ESR</td>
							<td class="phn">${previous.get(0).getESR() }</td>
							<td class="ind"><form:input type="text" path="ESR" value="${form.getESR()}" /></td>
						</tr>	
			<tr>
							<td class="pro">ALT/AST</td>
							<td class="phn">${previous.get(0).getALTOrAST() }</td>
							<td class="ind"><form:input type="text" path="ALTOrAST" value="${form.getALTOrAST()}" /></td>
						</tr>	
			<tr>
							<td class="pro">SLDH</td>
							<td class="phn">${previous.get(0).getSLDH() }</td>
							<td class="ind"><form:input type="text" path="SLDH" value="${form.getSLDH()}" /></td>
						</tr>	
			<tr>
							<td class="pro">TCK/CKMM</td>
							<td class="phn">${previous.get(0).getTCKorCKMM() }</td>
							<td class="ind"><form:input type="text" path="TCKorCKMM" value="${form.getTCKorCKMM()}" /></td>
						</tr>	
			
			
						<tr>
							<td class="pro">Other Data</td>
							<td class="phn">${previous.get(0).getOtherData() }</td>
							<td class="ind"><form:textarea path="otherData" class="textareatable" value="${form.getOtherData()}" /></td>		
						</tr>
			
			
				
				<tr><td><br><h4>Clinical Data</h4></td></tr>
			
						<tr>
							<td class="pro"></td>
							<td class="phn">${previous.get(0).getClinicalData() }</td>
							<td class="ind"><form:textarea path="clinicalData" class="textareatable" value="${form.getClinicalData()}" required="true" /></td>
						</tr>	
						
			
				<tr><td><br><h4>Self-Assessment</h4></td></tr>
			
						<tr class="selected">
							<td class="pro"></td>
							<td class="phn">${previous.get(0).getVAS() }</td>
							<td class="ind"><form:textarea path="VAS" class="textareatable" value="${form.getVAS()}" /></li></td>
						</tr>		
			
			
				<tr><td><br><h4>Meds/Plans</h4></td></tr>
						<tr>
							<td class="pro"></td>
							<td class="phn">${previous.get(0).getPlans() }</td>
							<td class="ind"><form:textarea path="plans" class="textareatable" value="${form.getPlans()}"  required="true" /></li></td>		
						</tr>
						
			
					</table>
</c:when>









<c:when test="${previous.size() >= 2 }">
			<table class="tablecontent">	
			
			
						<tr>
										
							<th class="navblank">&nbsp;</td>
							<th class="pro">${previous.get(0).getRevisionHistory().getDateCreated() }</td>
							<th class="phn">${previous.get(1).getRevisionHistory().getDateCreated() }</td>
							<th class="ind">${date}</td>
						</tr>
						
						<tr>
							<td class="pro">Weight (kg)</td>
							<td class="phn">${previous.get(0).getWeight() }</td>
							<td class="ind">${previous.get(1).getWeight() }</td>
							<td class="web"><form:input type="text" path="weight" value="${form.getWeight()}" pattern="\\d+(\\.\\d+)?"  required="true" /></td>
						</tr>	
						
						<tr class="selected">
							<td class="pro">Blood Pressure</td>
							<td class="phn">${previous.get(0).getBloodPressure() }</td>
							<td class="ind">${previous.get(1).getBloodPressure() }</td>
							<td class="web"><form:input type="text" path="bloodPressure" value="${form.getBloodPressure()}"  required="true" /></td>
						</tr>
			
			
			
			<tr><td><br><h4>Labs/Other Data</h4></td></tr>
						
						<tr>
							<td class="pro">Hgb/Hct</td>
							<td class="phn">${previous.get(0).getHgbOrHct() }</td>
							<td class="ind">${previous.get(1).getHgbOrHct() }</td>
							<td class="web"><form:input type="text" path="HgbOrHct" value="${form.getHgbOrHct()}" /></td>
						</tr>	
			<tr>
							<td class="pro">WBC/Platelet</td>
							<td class="phn">${previous.get(0).getWBCOPlatelet() }</td>
							<td class="ind">${previous.get(1).getWBCOPlatelet() }</td>
							<td class="web"><form:input type="text" path="WBCOPlatelet" value="${form.getWBCOPlatelet()}" /></td>
						</tr>	
			<tr>
							<td class="pro">ESR</td>
							<td class="phn">${previous.get(0).getESR() }</td>
							<td class="ind">${previous.get(1).getESR() }</td>
							<td class="web"><form:input type="text" path="ESR" value="${form.getESR()}" /></td>
						</tr>	
			<tr>
							<td class="pro">ALT/AST</td>
							<td class="phn">${previous.get(0).getALTOrAST() }</td>
							<td class="ind">${previous.get(1).getALTOrAST() }</td>
							<td class="web"><form:input type="text" path="ALTOrAST" value="${form.getALTOrAST()}" /></td>
						</tr>	
			<tr>
							<td class="pro">SLDH</td>
							<td class="phn">${previous.get(0).getSLDH() }</td>
							<td class="ind">${previous.get(1).getSLDH() }</td>
							<td class="web"><form:input type="text" path="SLDH" value="${form.getSLDH()}" /></td>
						</tr>	
			<tr>
							<td class="pro">TCK/CKMM</td>
							<td class="phn">${previous.get(0).getTCKorCKMM() }</td>
							<td class="ind">${previous.get(1).getTCKorCKMM() }</td>
							<td class="web"><form:input type="text" path="TCKorCKMM" value="${form.getTCKorCKMM()}" /></td>
						</tr>	
			
			
						<tr>
							<td class="pro">Other Data</td>
							<td class="phn">${previous.get(0).getOtherData() }</td>
							<td class="ind">${previous.get(1).getOtherData() }</td>
							<td class="web"><form:textarea path="otherData" class="textareatable" value="${form.getOtherData()}" /></td>		
						</tr>
			
			
				
				<tr><td><br><h4>Clinical Data</h4></td></tr>
			
						<tr>
							<td class="pro"></td>
							<td class="phn">${previous.get(0).getClinicalData() }</td>
							<td class="ind">${previous.get(1).getClinicalData() }</td>
							<td class="web"><form:textarea path="clinicalData" class="textareatable" value="${form.getClinicalData()}" required="true" /></td>
						</tr>	
						
			
				<tr><td><br><h4>Self-Assessment</h4></td></tr>
			
						<tr class="selected">
							<td class="pro"></td>
							<td class="phn">${previous.get(0).getVAS() }</td>
							<td class="ind">${previous.get(1).getVAS() }</td>
							<td class="web"><form:textarea path="VAS" class="textareatable" value="${form.getVAS()}" /></li></td>
						</tr>		
			
			
				<tr><td><br><h4>Meds/Plans</h4></td></tr>
						<tr>
							<td class="pro"></td>
							<td class="phn">${previous.get(0).getPlans() }</td>
							<td class="ind">${previous.get(1).getPlans() }</td>
							<td class="web"><form:textarea path="plans" class="textareatable" value="${form.getPlans()}" required="true"  /></li></td>		
						</tr>
						
			
					</table>
	</c:when>	
</c:choose>		
		<br/><br/><br/><br/>
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Update Form" class="btnSave"></span>
					<a href="view_inflammatory_myopath.it?pid=${patient.getId() }&fid=${form.id}"><span class="btn"><input type="button"
							value="Cancel" class="btnCancel" onClick="viewPotentialsList()"></span></a>
					<font style="padding-left:360px"></font>	
					<span class="btn"><input type="button"
						value="Back to Top" class="btnTop"></span>
				</ul>
			</section>
</form:form>

</li>

</ul>
			
			
			
			</div>
			</section>
		</div>
		</div>
	</div>		
</div>
		
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

	<script src="resources/js/expandCollapse.js"></script>
</body>
</html>