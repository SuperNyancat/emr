<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>Edit Systemic Sclerosis Flow Sheet</title>
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
				<div>
				<p class="titles">Systematic Sclerosis Flow Sheet</p><br><br>
				</div>
	
				
			<ul>

<li>
<form:form action="update_ss_flowsheet.it?pid=${patient.getId()}&fid=${form.getId()}" method="post" commandName="form">
	<form:hidden path="id" value="${form.getId() }"/>
	<form:hidden path="patient.id" value="${patient.getId()}"/>
	<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
	<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
	<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
									

<c:choose>

<c:when test="${previous == null}">
<table class="tablecontent2">

						<tr>
							
							<th class="navblank">&nbsp;</th>
							<th class="phn"><a href="">${date}</a></th>
						</tr>
	
			<tr>
				<td class="pro">Weight (kg)</td>
				<td class="phn"><form:input type="text" path="weight" pattern="\\d+(\\.\\d+)?" value="${form.getWeight()}" required="true" /></td>
			</tr>	
			
			<tr class="selected">
				<td class="pro">Blood Pressure</td>
				<td class="phn"><form:input type="text" path="bloodPressure" value="${form.getBloodPressure()}" required="true" /></td>
			</tr>

<tr><td><br><h4>Other Data</h4></td></tr>
	
				
			<tr>
				<td class="pro">Hgb/Hct</td>
				<td class="phn"><form:input type="text" path="HgbOrHct" value="${form.getHgbOrHct()}" /></td>
			</tr>	
<tr>
				<td class="pro">WBC</td>
				<td class="phn"><form:input type="text" path="WBC" value="${form.getWBC()}" /></td>
			</tr>	
<tr>
				<td class="pro">Platelet</td>
				<td class="phn"><form:input type="text" path="platelet" value="${form.getPlatelet()}" /></td>
			</tr>	
<tr>
				<td class="pro">ESR/CRP</td>
				<td class="phn"><form:input type="text" path="ESRorCRP" value="${form.getESRorCRP()}" /></td>
			</tr>	
<tr>
				<td class="pro">ALT/AST</td>
				<td class="phn"><form:input type="text" path="ALTorAST" value="${form.ALTorAST}" /></td>
			</tr>	

			<tr>
				<td class="pro">Other Data</td>
				<td class="phn"><form:textarea path="otherData" class="textareatable" value="${form.getOtherData()}" /></td>		
			</tr>	
			

<tr><td><br><h4>Rodnan skin scoring (0-normal, 1-weak, 2-intermediate, 3-severe)</h4></td></tr>
		
			<tr>
				<td class="pro">Face</td>
				<td class="phn">
					<form:radiobutton path="face" value="0" required="true" />0  
					<form:radiobutton path="face" value="1" required="true" />1
					<form:radiobutton path="face" value="2" required="true" />2
					<form:radiobutton path="face" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr class="selected">
				<td class="pro">Anterior Chest</td>
				<td class="phn">
					<form:radiobutton path="anteriorChest" value="0" required="true" />0  
					<form:radiobutton path="anteriorChest" value="1" required="true" />1
					<form:radiobutton path="anteriorChest" value="2" required="true" />2
					<form:radiobutton path="anteriorChest" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Upper Arm (R/L)</td>
				<td class="phn">
					<form:radiobutton path="upperArm" value="0" required="true" />0  
					<form:radiobutton path="upperArm" value="1" required="true" />1
					<form:radiobutton path="upperArm" value="2" required="true" />2
					<form:radiobutton path="upperArm" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Abdomen</td>
				<td class="phn">
					<form:radiobutton path="abdomen" value="0" required="true" />0  
					<form:radiobutton path="abdomen" value="1" required="true" />1
					<form:radiobutton path="abdomen" value="2" required="true" />2
					<form:radiobutton path="abdomen" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Forearm (R/L)</td>
				<td class="phn">
					<form:radiobutton path="foreArm" value="0" required="true" />0  
					<form:radiobutton path="foreArm" value="1" required="true" />1
					<form:radiobutton path="foreArm" value="2" required="true" />2
					<form:radiobutton path="foreArm" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Hand(R/L)</td>
				<td class="phn">
					<form:radiobutton path="hand" value="0" required="true" />0  
					<form:radiobutton path="hand" value="1" required="true" />1
					<form:radiobutton path="hand" value="2" required="true" />2
					<form:radiobutton path="hand" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Fingers(R/L)</td>
				<td class="phn">
					<form:radiobutton path="fingers" value="0" required="true" />0  
					<form:radiobutton path="fingers" value="1" required="true" />1
					<form:radiobutton path="fingers" value="2" required="true" />2
					<form:radiobutton path="fingers" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Thigh(R/L)</td>
				<td class="phn">
					<form:radiobutton path="thigh" value="0" required="true" />0  
					<form:radiobutton path="thigh" value="1" required="true" />1
					<form:radiobutton path="thigh" value="2" required="true" />2
					<form:radiobutton path="thigh" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Leg(R/L)</td>
				<td class="phn">
					<form:radiobutton path="leg" value="0" required="true" />0  
					<form:radiobutton path="leg" value="1" required="true" />1
					<form:radiobutton path="leg" value="2" required="true" />2
					<form:radiobutton path="leg" value="3" required="true" />3
				</td>
			</tr>	

			<tr>
				<td class="pro">Feet</td>
				<td class="phn">
					<form:radiobutton path="feet" value="0" required="true" />0  
					<form:radiobutton path="feet" value="1" required="true" />1
					<form:radiobutton path="feet" value="2" required="true" />2
					<form:radiobutton path="feet" value="3" required="true" />3
				</td>
			</tr>	

			<tr>
				<td class="pro">Total Skin Score(0-51)</td>
				<td class="phn">
					<form:input path="skinScore" pattern="\\d+(\\.\\d+)?" value="${form.getSkinScore()}" required="true" />
				</td>
			</tr>	

			<tr>
				<td class="pro">Leg</td>
				<td class="phn">
					<form:radiobutton path="leg" value="0" required="true" />0  
					<form:radiobutton path="leg" value="1" required="true" />1
					<form:radiobutton path="leg" value="2" required="true" />2
					<form:radiobutton path="leg" value="3" required="true" />3
				</td>
			</tr>	


<tr><td><br><h4>Self-Assessment</h4></td></tr>


			<tr>
				<td class="pro">Cardiac/<br>Pulmonary</td>
				<td class="phn"><form:input path="cardiacOrPulmonary" value="${form.getCardiacOrPulmonary()}" /></td>
			</tr>	

			<tr>
				<td class="pro">Gastrointestinal</td>
				<td class="phn"><form:input path="gastrointestinal" value="${form.getGastrointestinal()}" /></td>
			</tr>	

			<tr>
				<td class="pro">Renal</td>
				<td class="phn"><form:input path="renal" value="${form.getRenal()}" /></td>
			</tr>	
			

<tr><td><br><h4>Meds/Plans</h4></td></tr>
	
			<tr>
				<td class="pro"></td>
				<td class="web"><form:textarea path="plans" class="textareatable" value="${form.getPlans()}" /></td>
			</tr>
			

		</table>

</c:when>












<c:when test="${previous.size() == 1 }">
<table class="tablecontent2">

						<tr>
							
							<th class="navblank">&nbsp;</th>
							<th class="pro"><a href="">${previous.get(0).getRevisionHistory().getDateCreated() }</a></th>
							<th class="phn"><a href="">${date}</a></th>
						</tr>
		
			<tr>
				<td class="pro">Weight (kg)</td>
				<td class="phn">${previous.get(0).getWeight()}</td>
				<td class="ind"><form:input type="text" path="weight" pattern="\\d+(\\.\\d+)?" value="${form.getWeight()}" required="true" /></td>
			</tr>	
			
			<tr class="selected">
				<td class="pro">Blood Pressure</td>
				<td class="phn">${previous.get(0).getBloodPressure() }</td>
				<td class="ind"><form:input type="text" path="bloodPressure" value="${form.getBloodPressure()}" required="true" /></td>
			</tr>

<tr><td><br><h4>Other Data</h4></td></tr>
	
				
			<tr>
				<td class="pro">Hgb/Hct</td>
				<td class="phn">${previous.get(0).getHgbOrHct() }</td>
				<td class="ind"><form:input type="text" path="HgbOrHct" value="${form.getHgbOrHct()}" /></td>
			</tr>	
<tr>
				<td class="pro">WBC</td>
				<td class="phn">${previous.get(0).getWBC() }</td>
				<td class="ind"><form:input type="text" path="WBC" value="${form.getWBC()}" /></td>
			</tr>	
<tr>
				<td class="pro">Platelet</td>
				<td class="phn">${previous.get(0).getPlatelet() }</td>
				<td class="ind"><form:input type="text" path="platelet" value="${form.getPlatelet()}" /></td>
			</tr>	
<tr>
				<td class="pro">ESR/CRP</td>
				<td class="phn">${previous.get(0).getESRorCRP() }</td>
				<td class="ind"><form:input type="text" path="ESRorCRP" value="${form.getESRorCRP()}" /></td>
			</tr>	
<tr>
				<td class="pro">ALT/AST</td>
				<td class="phn">${previous.get(0).getALTorAST() }</td>
				<td class="ind"><form:input type="text" path="ALTorAST" value="${form.ALTorAST}" /></td>
			</tr>	

			<tr>
				<td class="pro">Other Data</td>
				<td class="phn">${previous.get(0).getOtherData() }</td>
				<td class="ind"><form:textarea path="otherData" class="textareatable" value="${form.getOtherData()}" /></td>		
			</tr>	
			

<tr><td><br><h4>Rodnan skin scoring (0-normal, 1-weak, 2-intermediate, 3-severe)</h4></td></tr>
		
			<tr>
				<td class="pro">Face</td>
				<td class="phn">${previous.get(0).getFace() }</td>
				<td class="ind">
					<form:radiobutton path="face" value="0" required="true" />0  
					<form:radiobutton path="face" value="1" required="true" />1
					<form:radiobutton path="face" value="2" required="true" />2
					<form:radiobutton path="face" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr class="selected">
				<td class="pro">Anterior Chest</td>
				<td class="phn">${previous.get(0).getAnteriorChest() }</td>
				<td class="ind">
					<form:radiobutton path="anteriorChest" value="0" required="true" />0  
					<form:radiobutton path="anteriorChest" value="1" required="true" />1
					<form:radiobutton path="anteriorChest" value="2" required="true" />2
					<form:radiobutton path="anteriorChest" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Upper Arm (R/L)</td>
				<td class="phn">${previous.get(0).getUpperArm() }</td>
				<td class="ind">
					<form:radiobutton path="upperArm" value="0" required="true" />0  
					<form:radiobutton path="upperArm" value="1" required="true" />1
					<form:radiobutton path="upperArm" value="2" required="true" />2
					<form:radiobutton path="upperArm" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Abdomen</td>
				<td class="phn">${previous.get(0).getAbdomen() }</td>
				<td class="ind">
					<form:radiobutton path="abdomen" value="0" required="true" />0  
					<form:radiobutton path="abdomen" value="1" required="true" />1
					<form:radiobutton path="abdomen" value="2" required="true" />2
					<form:radiobutton path="abdomen" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Forearm (R/L)</td>
				<td class="phn">${previous.get(0).getForeArm() }</td>
				<td class="ind">
					<form:radiobutton path="foreArm" value="0" required="true" />0  
					<form:radiobutton path="foreArm" value="1" required="true" />1
					<form:radiobutton path="foreArm" value="2" required="true" />2
					<form:radiobutton path="foreArm" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Hand(R/L)</td>
				<td class="phn">${previous.get(0).getHand() }</td>
				<td class="ind">
					<form:radiobutton path="hand" value="0" required="true" />0  
					<form:radiobutton path="hand" value="1" required="true" />1
					<form:radiobutton path="hand" value="2" required="true" />2
					<form:radiobutton path="hand" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Fingers(R/L)</td>
				<td class="phn">${previous.get(0).getFingers() }</td>
				<td class="ind">
					<form:radiobutton path="fingers" value="0" required="true" />0  
					<form:radiobutton path="fingers" value="1" required="true" />1
					<form:radiobutton path="fingers" value="2" required="true" />2
					<form:radiobutton path="fingers" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Thigh(R/L)</td>
				<td class="phn">${previous.get(0).getThigh() }</td>
				<td class="ind">
					<form:radiobutton path="thigh" value="0" required="true" />0  
					<form:radiobutton path="thigh" value="1" required="true" />1
					<form:radiobutton path="thigh" value="2" required="true" />2
					<form:radiobutton path="thigh" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Leg(R/L)</td>
				<td class="phn">${previous.get(0).getLeg() }</td>
				<td class="ind">
					<form:radiobutton path="leg" value="0" required="true" />0  
					<form:radiobutton path="leg" value="1" required="true" />1
					<form:radiobutton path="leg" value="2" required="true" />2
					<form:radiobutton path="leg" value="3" required="true" />3
				</td>
			</tr>	

			<tr>
				<td class="pro">Feet</td>
				<td class="phn">${previous.get(0).getFeet() }</td>
				<td class="ind">
					<form:radiobutton path="feet" value="0" required="true" />0  
					<form:radiobutton path="feet" value="1" required="true" />1
					<form:radiobutton path="feet" value="2" required="true" />2
					<form:radiobutton path="feet" value="3" required="true" />3
				</td>
			</tr>	

			<tr>
				<td class="pro">Total Skin Score(0-51)</td>
				<td class="phn">${previous.get(0).getSkinScore() }</td>
				<td class="ind">
					<form:input path="skinScore" pattern="\\d+(\\.\\d+)?" value="${form.getSkinScore()}" required="true" />
				</td>
			</tr>	

			<tr>
				<td class="pro">Leg</td>
				<td class="phn">${previous.get(0).getLeg() }</td>
				<td class="ind">
					<form:radiobutton path="leg" value="0" required="true" />0  
					<form:radiobutton path="leg" value="1" required="true" />1
					<form:radiobutton path="leg" value="2" required="true" />2
					<form:radiobutton path="leg" value="3" required="true" />3
				</td>
			</tr>	


<tr><td><br><h4>Self-Assessment</h4></td></tr>


			<tr>
				<td class="pro">Cardiac/<br>Pulmonary</td>
				<td class="phn">${previous.get(0).getCardiacOrPulmonary()}</td>
				<td class="ind"><form:input path="cardiacOrPulmonary" value="${form.getCardiacOrPulmonary()}" /></td>
			</tr>	

			<tr>
				<td class="pro">Gastrointestinal</td>
				<td class="phn">${previous.get(0).getGastrointestinal()}</td>
				<td class="ind"><form:input path="gastrointestinal" value="${form.getGastrointestinal()}" /></td>
			</tr>	

			<tr>
				<td class="pro">Renal</td>
				<td class="phn">${previous.get(0).getRenal()}</td>
				<td class="ind"><form:input path="renal" value="${form.getRenal()}" /></td>
			</tr>	
			

<tr><td><br><h4>Meds/Plans</h4></td></tr>
	
			<tr>	
				<td class="pro"></td>
				<td class="phn">${previous.get(0).getPlans()}</td>
				<td class="ind"><form:textarea path="plans" class="textareatable" value="${form.getPlans()}" /></td>
			</tr>
			

		</table>

</c:when>









<c:when test="${previous.size() >= 2 }">
<table class="tablecontent2">

						<tr>
							
							<th class="navblank">&nbsp;</th>
							<th class="pro"><a href="">${previous.get(0).getRevisionHistory().getDateCreated() }</a></th>
							<th class="phn"><a href="">${previous.get(1).getRevisionHistory().getDateCreated() }</a></th>
							<th class="ind"><a href="">${date}</a></th>
						</tr>
				
			<tr>
				<td class="pro">Weight (kg)</td>
				<td class="phn">${previous.get(0).getWeight()}</td>
				<td class="ind">${previous.get(1).getWeight()}</td>
				<td class="web"><form:input type="text" path="weight" pattern="\\d+(\\.\\d+)?" value="${form.getWeight()}" required="true" /></td>
			</tr>	
			
			<tr class="selected">
				<td class="pro">Blood Pressure</td>
				<td class="phn">${previous.get(0).getBloodPressure() }</td>
				<td class="ind">${previous.get(1).getBloodPressure() }</td>
				<td class="web"><form:input type="text" path="bloodPressure" value="${form.getBloodPressure()}" required="true" /></td>
			</tr>

<tr><td><br><h4>Other Data</h4></td></tr>
	
				
			<tr>
				<td class="pro">Hgb/Hct</td>
				<td class="phn">${previous.get(0).getHgbOrHct() }</td>
				<td class="ind">${previous.get(1).getHgbOrHct() }</td>
				<td class="web"><form:input type="text" path="HgbOrHct" value="${form.getHgbOrHct()}" /></td>
			</tr>	
<tr>
				<td class="pro">WBC</td>
				<td class="phn">${previous.get(0).getWBC() }</td>
				<td class="ind">${previous.get(1).getWBC() }</td>
				<td class="web"><form:input type="text" path="WBC" value="${form.getWBC()}" /></td>
			</tr>	
<tr>
				<td class="pro">Platelet</td>
				<td class="phn">${previous.get(0).getPlatelet() }</td>
				<td class="ind">${previous.get(1).getPlatelet() }</td>
				<td class="web"><form:input type="text" path="platelet" value="${form.getPlatelet()}" /></td>
			</tr>	
<tr>
				<td class="pro">ESR/CRP</td>
				<td class="phn">${previous.get(0).getESRorCRP() }</td>
				<td class="ind">${previous.get(1).getESRorCRP() }</td>
				<td class="web"><form:input type="text" path="ESRorCRP" value="${form.getESRorCRP()}" /></td>
			</tr>	
<tr>
				<td class="pro">ALT/AST</td>
				<td class="phn">${previous.get(0).getALTorAST() }</td>
				<td class="ind">${previous.get(1).getALTorAST() }</td>
				<td class="web"><form:input type="text" path="ALTorAST" value="${form.ALTorAST}" /></td>
			</tr>	

			<tr>
				<td class="pro">Other Data</td>
				<td class="phn">${previous.get(0).getOtherData() }</td>
				<td class="ind">${previous.get(1).getOtherData() }</td>
				<td class="web"><form:textarea path="otherData" class="textareatable" value="${form.getOtherData()}" /></td>		
			</tr>	
			

<tr><td><br><h4>Rodnan skin scoring (0-normal, 1-weak, 2-intermediate, 3-severe)</h4></td></tr>
		
			<tr>
				<td class="pro">Face</td>
				<td class="phn">${previous.get(0).getFace() }</td>
				<td class="ind">${previous.get(1).getFace() }</td>
				<td class="web">
					<form:radiobutton path="face" value="0" required="true" />0  
					<form:radiobutton path="face" value="1" required="true" />1
					<form:radiobutton path="face" value="2" required="true" />2
					<form:radiobutton path="face" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr class="selected">
				<td class="pro">Anterior Chest</td>
				<td class="phn">${previous.get(0).getAnteriorChest() }</td>
				<td class="ind">${previous.get(1).getAnteriorChest() }</td>
				<td class="web">
					<form:radiobutton path="anteriorChest" value="0" required="true" />0  
					<form:radiobutton path="anteriorChest" value="1" required="true" />1
					<form:radiobutton path="anteriorChest" value="2" required="true" />2
					<form:radiobutton path="anteriorChest" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Upper Arm (R/L)</td>
				<td class="phn">${previous.get(0).getUpperArm() }</td>
				<td class="ind">${previous.get(1).getUpperArm() }</td>
				<td class="web">
					<form:radiobutton path="upperArm" value="0" required="true" />0  
					<form:radiobutton path="upperArm" value="1" required="true" />1
					<form:radiobutton path="upperArm" value="2" required="true" />2
					<form:radiobutton path="upperArm" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Abdomen</td>
				<td class="phn">${previous.get(0).getAbdomen() }</td>
				<td class="ind">${previous.get(1).getAbdomen() }</td>
				<td class="web">
					<form:radiobutton path="abdomen" value="0" required="true" />0  
					<form:radiobutton path="abdomen" value="1" required="true" />1
					<form:radiobutton path="abdomen" value="2" required="true" />2
					<form:radiobutton path="abdomen" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Forearm (R/L)</td>
				<td class="phn">${previous.get(0).getForeArm() }</td>
				<td class="ind">${previous.get(1).getForeArm() }</td>
				<td class="web">
					<form:radiobutton path="foreArm" value="0" required="true" />0  
					<form:radiobutton path="foreArm" value="1" required="true" />1
					<form:radiobutton path="foreArm" value="2" required="true" />2
					<form:radiobutton path="foreArm" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Hand(R/L)</td>
				<td class="phn">${previous.get(0).getHand() }</td>
				<td class="ind">${previous.get(1).getHand() }</td>
				<td class="web">
					<form:radiobutton path="hand" value="0" required="true" />0  
					<form:radiobutton path="hand" value="1" required="true" />1
					<form:radiobutton path="hand" value="2" required="true" />2
					<form:radiobutton path="hand" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Fingers(R/L)</td>
				<td class="phn">${previous.get(0).getFingers() }</td>
				<td class="ind">${previous.get(1).getFingers() }</td>
				<td class="web">
					<form:radiobutton path="fingers" value="0" required="true" />0  
					<form:radiobutton path="fingers" value="1" required="true" />1
					<form:radiobutton path="fingers" value="2" required="true" />2
					<form:radiobutton path="fingers" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Thigh(R/L)</td>
				<td class="phn">${previous.get(0).getThigh() }</td>
				<td class="ind">${previous.get(1).getThigh() }</td>
				<td class="web">
					<form:radiobutton path="thigh" value="0" required="true" />0  
					<form:radiobutton path="thigh" value="1" required="true" />1
					<form:radiobutton path="thigh" value="2" required="true" />2
					<form:radiobutton path="thigh" value="3" required="true" />3
				</td>
			</tr>	
			
			<tr>
				<td class="pro">Leg(R/L)</td>
				<td class="phn">${previous.get(0).getLeg() }</td>
				<td class="ind">${previous.get(1).getLeg() }</td>
				<td class="web">
					<form:radiobutton path="leg" value="0" required="true" />0  
					<form:radiobutton path="leg" value="1" required="true" />1
					<form:radiobutton path="leg" value="2" required="true" />2
					<form:radiobutton path="leg" value="3" required="true" />3
				</td>
			</tr>	

			<tr>
				<td class="pro">Feet</td>
				<td class="phn">${previous.get(0).getFeet() }</td>
				<td class="ind">${previous.get(1).getFeet() }</td>
				<td class="web">
					<form:radiobutton path="feet" value="0" required="true" />0  
					<form:radiobutton path="feet" value="1" required="true" />1
					<form:radiobutton path="feet" value="2" required="true" />2
					<form:radiobutton path="feet" value="3" required="true" />3
				</td>
			</tr>	

			<tr>
				<td class="pro">Total Skin Score(0-51)</td>
				<td class="phn">${previous.get(0).getSkinScore() }</td>
				<td class="ind">${previous.get(1).getSkinScore() }</td>
				<td class="web">
					<form:input path="skinScore" pattern="\\d+(\\.\\d+)?" value="${form.getSkinScore()}" required="true" />
				</td>
			</tr>	

			<tr>
				<td class="pro">Leg</td>
				<td class="phn">${previous.get(0).getLeg() }</td>
				<td class="ind">${previous.get(1).getLeg() }</td>
				<td class="web">
					<form:radiobutton path="leg" value="0" required="true" />0  
					<form:radiobutton path="leg" value="1" required="true" />1
					<form:radiobutton path="leg" value="2" required="true" />2
					<form:radiobutton path="leg" value="3" required="true" />3
				</td>
			</tr>	


<tr><td><br><h4>Self-Assessment</h4></td></tr>


			<tr>
				<td class="pro">Cardiac/<br>Pulmonary</td>
				<td class="phn">${previous.get(0).getCardiacOrPulmonary()}</td>
				<td class="ind">${previous.get(1).getCardiacOrPulmonary()}</td>
				<td class="web"><form:input path="cardiacOrPulmonary" value="${form.getCardiacOrPulmonary()}" /></td>
			</tr>	

			<tr>
				<td class="pro">Gastrointestinal</td>
				<td class="phn">${previous.get(0).getGastrointestinal()}</td>
				<td class="ind">${previous.get(1).getGastrointestinal()}</td>
				<td class="web"><form:input path="gastrointestinal" value="${form.getGastrointestinal()}" /></td>
			</tr>	

			<tr>
				<td class="pro">Renal</td>
				<td class="phn">${previous.get(0).getRenal()}</td>
				<td class="ind">${previous.get(1).getRenal()}</td>
				<td class="web"><form:input path="renal" value="${form.getRenal()}" /></td>
			</tr>	
			

<tr><td><br><h4>Meds/Plans</h4></td></tr>
	
			<tr>
				<td class="phn">${previous.get(0).getPlans()}</td>
				<td class="ind">${previous.get(1).getPlans()}</td>
				<td class="web"><form:textarea path="plans" class="textareatable" value="${form.getPlans()}" /></td>
			</tr>
			

		</table>
</c:when>
</c:choose>
<br/><br/><br/><br/>
				<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Update Form" class="btnSave"></span>
					<a href="view_SS_flowsheet.it?pid=${patient.getId() }&fid=${form.id}"><span class="btn"><input type="button"
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

</div>
</body>
</html>