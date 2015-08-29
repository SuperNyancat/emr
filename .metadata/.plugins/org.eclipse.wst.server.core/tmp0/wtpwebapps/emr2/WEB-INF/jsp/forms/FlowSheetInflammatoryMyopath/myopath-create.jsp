<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Create Inflammatory Myopathy Flow Sheet</title>
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
<form:form action="create_inflammatory_myopath_flowsheet.it?id=${patient.getId() }" method="post" commandName="form">

<c:choose>


<c:when test="${previous == null}">
<table class="tablecontent3">	
			
			
						<tr>
										
							<th class="navblank">&nbsp;</td>
							<th class="phn">${date}</td>
						</tr>
					
						<tr>
							<td class="pro">Weight (kg)</td>
							<td class="phn"><form:input type="text" pattern="\\d+(\\.\\d+)?" path="weight" required="true" /></td>
						</tr>	
						
						<tr class="selected">
							<td class="pro">Blood Pressure</td>
							<td class="phn"><form:input type="text" path="bloodPressure" required="true" /></td>
						</tr>
			
			
			
			<tr><td><br><h4>Labs/Other Data</h4></td></tr>
						
						<tr>
							<td class="pro">Hgb/Hct</td>
							<td class="phn"><form:input type="text" path="HgbOrHct"/></td>
						</tr>	
			<tr>
							<td class="pro">WBC/Platelet</td>
							<td class="phn"><form:input type="text" path="WBCOPlatelet"/></td>
						</tr>	
			<tr>
							<td class="pro">ESR</td>
							<td class="phn"><form:input type="text" path="ESR"/></td>
						</tr>	
			<tr>
							<td class="pro">ALT/AST</td>
							<td class="phn"><form:input type="text" path="ALTOrAST"/></td>
						</tr>	
			<tr>
							<td class="pro">SLDH</td>
							<td class="phn"><form:input type="text" path="SLDH"/></td>
						</tr>	
			<tr>
							<td class="pro">TCK/CKMM</td>
							<td class="phn"><form:input type="text" path="TCKorCKMM"/></td>
						</tr>	
			
			
						<tr>
							<td class="pro">Other Data</td>
							<td class="phn"><form:textarea path="otherData" class="textareatable"/></td>		
						</tr>
			
			
				
				<tr><td><br><h4>Clinical Data</h4></td></tr>
			
						<tr>
							<td class="pro"></td>
							<td class="phn"><form:textarea path="clinicalData" class="textareatable" required="true" /></td>
						</tr>	
						
			
				<tr><td><br><h4>Self-Assessment</h4></td></tr>
			
						<tr class="selected">
							<td class="pro"></td>
							<td class="phn"><form:textarea path="VAS" class="textareatable"/></li></td>
						</tr>		
			
			
				<tr><td><br><h4>Meds/Plans</h4></td></tr>
						<tr>
							<td class="pro"></td>
							<td class="phn"><form:textarea path="plans" class="textareatable" required="true" /></li></td>		
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
							<td class="ind"><form:input type="text" path="weight" pattern="\\d+(\\.\\d+)?"  required="true" /></td>
						</tr>	
						
						<tr class="selected">
							<td class="pro">Blood Pressure</td>
							<td class="phn">${previous.get(0).getBloodPressure() }</td>
							<td class="ind"><form:input type="text" path="bloodPressure" required="true" /></td>
						</tr>
			
			
			
			<tr><td><br><h4>Labs/Other Data</h4></td></tr>
						
						<tr>
							<td class="pro">Hgb/Hct</td>
							<td class="phn">${previous.get(0).getHgbOrHct() }</td>
							<td class="ind"><form:input type="text" path="HgbOrHct"/></td>
						</tr>	
			<tr>
							<td class="pro">WBC/Platelet</td>
							<td class="phn">${previous.get(0).getWBCOPlatelet() }</td>
							<td class="ind"><form:input type="text" path="WBCOPlatelet"/></td>
						</tr>	
			<tr>
							<td class="pro">ESR</td>
							<td class="phn">${previous.get(0).getESR() }</td>
							<td class="ind"><form:input type="text" path="ESR"/></td>
						</tr>	
			<tr>
							<td class="pro">ALT/AST</td>
							<td class="phn">${previous.get(0).getALTOrAST() }</td>
							<td class="ind"><form:input type="text" path="ALTOrAST"/></td>
						</tr>	
			<tr>
							<td class="pro">SLDH</td>
							<td class="phn">${previous.get(0).getSLDH() }</td>
							<td class="ind"><form:input type="text" path="SLDH"/></td>
						</tr>	
			<tr>
							<td class="pro">TCK/CKMM</td>
							<td class="phn">${previous.get(0).getTCKorCKMM() }</td>
							<td class="ind"><form:input type="text" path="TCKorCKMM"/></td>
						</tr>	
			
			
						<tr>
							<td class="pro">Other Data</td>
							<td class="phn">${previous.get(0).getOtherData() }</td>
							<td class="ind"><form:textarea path="otherData" class="textareatable"/></td>		
						</tr>
			
			
				
				<tr><td><br><h4>Clinical Data</h4></td></tr>
			
						<tr>
							<td class="pro"></td>
							<td class="phn">${previous.get(0).getClinicalData() }</td>
							<td class="ind"><form:textarea path="clinicalData" class="textareatable" required="true" /></td>
						</tr>	
						
			
				<tr><td><br><h4>Self-Assessment</h4></td></tr>
			
						<tr class="selected">
							<td class="pro"></td>
							<td class="phn">${previous.get(0).getVAS() }</td>
							<td class="ind"><form:textarea path="VAS" class="textareatable"/></li></td>
						</tr>		
			
			
				<tr><td><br><h4>Meds/Plans</h4></td></tr>
						<tr>
							<td class="pro"></td>
							<td class="phn">${previous.get(0).getPlans() }</td>
							<td class="ind"><form:textarea path="plans" class="textareatable" required="true" /></li></td>		
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
							<td class="web"><form:input type="text" path="weight" pattern="\\d+(\\.\\d+)?" required="true" /></td>
						</tr>	
						
						<tr class="selected">
							<td class="pro">Blood Pressure</td>
							<td class="phn">${previous.get(0).getBloodPressure() }</td>
							<td class="ind">${previous.get(1).getBloodPressure() }</td>
							<td class="web"><form:input type="text" path="bloodPressure" required="true" /></td>
						</tr>
			
			
			
			<tr><td><br><h4>Labs/Other Data</h4></td></tr>
						
						<tr>
							<td class="pro">Hgb/Hct</td>
							<td class="phn">${previous.get(0).getHgbOrHct() }</td>
							<td class="ind">${previous.get(1).getHgbOrHct() }</td>
							<td class="web"><form:input type="text" path="HgbOrHct"/></td>
						</tr>	
			<tr>
							<td class="pro">WBC/Platelet</td>
							<td class="phn">${previous.get(0).getWBCOPlatelet() }</td>
							<td class="ind">${previous.get(1).getWBCOPlatelet() }</td>
							<td class="web"><form:input type="text" path="WBCOPlatelet"/></td>
						</tr>	
			<tr>
							<td class="pro">ESR</td>
							<td class="phn">${previous.get(0).getESR() }</td>
							<td class="ind">${previous.get(1).getESR() }</td>
							<td class="web"><form:input type="text" path="ESR"/></td>
						</tr>	
			<tr>
							<td class="pro">ALT/AST</td>
							<td class="phn">${previous.get(0).getALTOrAST() }</td>
							<td class="ind">${previous.get(1).getALTOrAST() }</td>
							<td class="web"><form:input type="text" path="ALTOrAST"/></td>
						</tr>	
			<tr>
							<td class="pro">SLDH</td>
							<td class="phn">${previous.get(0).getSLDH() }</td>
							<td class="ind">${previous.get(1).getSLDH() }</td>
							<td class="web"><form:input type="text" path="SLDH"/></td>
						</tr>	
			<tr>
							<td class="pro">TCK/CKMM</td>
							<td class="phn">${previous.get(0).getTCKorCKMM() }</td>
							<td class="ind">${previous.get(1).getTCKorCKMM() }</td>
							<td class="web"><form:input type="text" path="TCKorCKMM"/></td>
						</tr>	
			
			
						<tr>
							<td class="pro">Other Data</td>
							<td class="phn">${previous.get(0).getOtherData() }</td>
							<td class="ind">${previous.get(1).getOtherData() }</td>
							<td class="web"><form:textarea path="otherData" class="textareatable"/></td>		
						</tr>
			
			
				
				<tr><td><br><h4>Clinical Data</h4></td></tr>
			
						<tr>
							<td class="pro"></td>
							<td class="phn">${previous.get(0).getClinicalData() }</td>
							<td class="ind">${previous.get(1).getClinicalData() }</td>
							<td class="web"><form:textarea path="clinicalData" class="textareatable" required="true" /></td>
						</tr>	
						
			
				<tr><td><br><h4>Self-Assessment</h4></td></tr>
			
						<tr class="selected">
							<td class="pro"></td>
							<td class="phn">${previous.get(0).getVAS() }</td>
							<td class="ind">${previous.get(1).getVAS() }</td>
							<td class="web"><form:textarea path="VAS" class="textareatable"/></li></td>
						</tr>		
			
			
				<tr><td><br><h4>Meds/Plans</h4></td></tr>
						<tr>
							<td class="pro"></td>
							<td class="phn">${previous.get(0).getPlans() }</td>
							<td class="ind">${previous.get(1).getPlans() }</td>
							<td class="web"><form:textarea path="plans" class="textareatable" required="true" /></li></td>		
						</tr>
						
			
					</table>
	</c:when>	
</c:choose>		<br/><br/><br/><br/>
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Add Form" class="btnSave"></span>
					<a href="inflammatory_myopath_table.it?id=${patient.id }"><span class="btn"><input type="button"
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

</body>
</html>