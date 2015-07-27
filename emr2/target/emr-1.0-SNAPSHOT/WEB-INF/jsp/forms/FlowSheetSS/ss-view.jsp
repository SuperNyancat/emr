<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>View SS Flowsheet Form</title>
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
		<form:form commandName="form" action="SS_flowsheet_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="edit_ss.it" method="GET">
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
			<form:form commandName="form" action="delete_ss.it" method="GET">
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
	
		<form class="crmForm">
			<div class="tab-content">
				<section class="settingBody clrfix">		
					<div class = "left">
						<jsp:include page="../../headers/patient-left.jsp" />
					</div>
					
<div class="right">

				<p class="titles"> Systemic Sclerosis Flow Sheet</p><br><br>
	
				
			<ul>

<li>


<c:choose>
<c:when test="${previous == null || previous.size() == 0}">
<table class="tablecontent">
	<tr>
					
		<th class="navblank">&nbsp;</th>
		<th class="pro"><a href="">${form.getRevisionHistory().getDateCreated()}</a></th>
	</tr>


	<tr>
		<td class="pro">Weight</td>
		<td class="phn"><label>${form.getWeight()}</label></td>
	</tr>	
	
	<tr>
		<td class="pro">Blood Pressure</td>
		<td class="phn"><label>${form.getBloodPressure()}</label></td>
			</tr>

<tr><td><br><h4>Labs/Other Data<br></h4></td></tr>
			
			<tr>
				<td class="pro">Hgb/Hct</td>
		<td class="phn"><label>${form.getHgbOrHct()}</label></td>
			</tr>	
<tr>
				<td class="pro">WBC</td>
		<td class="phn"><label>${form.getWBC()}</label></td>
			</tr>	
<tr>
				<td class="pro">Platelet</td>
		<td class="phn"><label>${form.getPlatelet()}</label></td>
			</tr>	
<tr>
				<td class="pro">ESR/CRP</td>
		<td class="phn"><label>${form.getESRorCRP()}</label></td>
			</tr>	
<tr>
				<td class="pro">ALT/AST</td>
		<td class="phn"><label>${form.getALTorAST()}</label></td>
			</tr>	
<tr>
				<td class="pro">Other Data</td>
		<td class="phn"><label>${form.getOtherData()}</label></td>
	</tr>

<tr><td><br><h4>Rodnan Skin Coloring<br></h4></td></tr>
<tr>
				<td class="pro">Face</td>
		<td class="phn"><label>${form.getFace()}</label></td>
	</tr>
<tr>
				<td class="pro">Anterior Chest</td>
		<td class="phn"><label>${form.getAnteriorChest()}</label></td>
	</tr>
<tr>
				<td class="pro">Upper Arm</td>
		<td class="phn"><label>${form.getUpperArm()}</label></td>
	</tr>
<tr>
				<td class="pro">Abdomen</td>
		<td class="phn"><label>${form.getAbdomen()}</label></td>
	</tr>
<tr>
				<td class="pro">Forearm</td>
		<td class="phn"><label>${form.getForeArm()}</label></td>
	</tr>
<tr>
				<td class="pro">Hand</td>
		<td class="phn"><label>${form.getHand()}</label></td>
	</tr>
<tr>
				<td class="pro">Fingers</td>
		<td class="phn"><label>${form.getFingers()}</label></td>
	</tr>
<tr>
				<td class="pro">Thigh</td>
		<td class="phn"><label>${form.getThigh()}</label></td>
	</tr>
<tr>
				<td class="pro">Leg</td>
		<td class="phn"><label>${form.getLeg()}</label></td>
	</tr>
<tr>
				<td class="pro">Feet</td>
		<td class="phn"><label>${form.getFeet()}</label></td>
	</tr>
<tr>
				<td class="pro">Total Skin Score</td>
		<td class="phn"><label>${form.getSkinScore()}</label></td>
	</tr>

	
<tr><td><br><h4>Cardiac/Pulmonary<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
			<td class="phn"><label>${form.getCardiacOrPulmonary()}</label></td>
			</tr>	


<tr><td><br><h4>Gastrointestinal<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
		<td class="phn"><label class="textareatable">${form.getGastrointestinal()}</label></td>
			</tr>
			
<tr><td><br><h4>Renal<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
		<td class="phn"><label class="textareatable">${form.getRenal()}</label></td>
			</tr>				

<tr><td><br><h4>Meds/Plans<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
		<td class="phn"><label class="textareatable">${form.getPlans()}</label></td>		
	</tr>
</table>
</c:when>








<c:when test="${previous.size() == 1 }">
<table class="tablecontent">
	<tr>
					
		<th class="navblank">&nbsp;</th>
		<th class="pro"><a href="">${previous.get(0).getRevisionHistory().getDateCreated() }</a></th>
		<th class="phn"><a href="">${form.getRevisionHistory().getDateCreated()}</a></th>
	</tr>


	<tr>
		<td class="pro">Weight</td>
		<td class="phn"><label>${previous.get(0).getWeight() }</label></td>
		<td class="ind"><label>${form.getWeight()}</label></td>
	</tr>	
	
	<tr>
		<td class="pro">Blood Pressure</td>
		<td class="phn"><label>${previous.get(0).getBloodPressure() }</label></td>
		<td class="ind"><label>${form.getBloodPressure()}</label></td>
			</tr>

<tr><td><br><h4>Labs/Other Data<br></h4></td></tr>
			
			<tr>
				<td class="pro">Hgb/Hct</td>
				<td class="phn">${previous.get(0).getHgbOrHct()}</td>
		<td class="ind"><label>${form.getHgbOrHct()}</label></td>
			</tr>	
<tr>
				<td class="pro">WBC</td>
				<td class="phn">${previous.get(0).getWBC()}</td>
		<td class="ind"><label>${form.getWBC()}</label></td>
			</tr>	
<tr>
				<td class="pro">Platelet</td>
				<td class="phn">${previous.get(0).getPlatelet()}</td>
		<td class="ind"><label>${form.getPlatelet()}</label></td>
			</tr>	
<tr>
				<td class="pro">ESR/CRP</td>
				<td class="phn">${previous.get(0).getESRorCRP()}</td>
		<td class="ind"><label>${form.getESRorCRP()}</label></td>
			</tr>	
<tr>
				<td class="pro">ALT/AST</td>
				<td class="phn">${previous.get(0).getALTorAST()}</td>
		<td class="ind"><label>${form.getALTorAST()}</label></td>
			</tr>	
<tr>
				<td class="pro">Other Data</td>
				<td class="phn">${previous.get(0).getOtherData()}</td>
		<td class="ind"><label>${form.getOtherData()}</label></td>
	</tr>

<tr><td><br><h4>Rodnan Skin Coloring<br></h4></td></tr>
<tr>
				<td class="pro">Face</td>
				<td class="phn">${previous.get(0).getFace()}</td>
		<td class="ind"><label>${form.getFace()}</label></td>
	</tr>
<tr>
				<td class="pro">Anterior Chest</td>
				<td class="phn">${previous.get(0).getAnteriorChest()}</td>
		<td class="ind"><label>${form.getAnteriorChest()}</label></td>
	</tr>
<tr>
				<td class="pro">Upper Arm</td>
				<td class="phn">${previous.get(0).getUpperArm()}</td>
		<td class="ind"><label>${form.getUpperArm()}</label></td>
	</tr>
<tr>
				<td class="pro">Abdomen</td>
				<td class="phn">${previous.get(0).getAbdomen()}</td>
		<td class="ind"><label>${form.getAbdomen()}</label></td>
	</tr>
<tr>
				<td class="pro">Forearm</td>
				<td class="phn">${previous.get(0).getForeArm()}</td>
		<td class="ind"><label>${form.getForeArm()}</label></td>
	</tr>
<tr>
				<td class="pro">Hand</td>
				<td class="phn">${previous.get(0).getHand()}</td>
		<td class="ind"><label>${form.getHand()}</label></td>
	</tr>
<tr>
				<td class="pro">Fingers</td>
				<td class="phn">${previous.get(0).getFingers()}</td>
		<td class="ind"><label>${form.getFingers()}</label></td>
	</tr>
<tr>
				<td class="pro">Thigh</td>
				<td class="phn">${previous.get(0).getThigh()}</td>
		<td class="ind"><label>${form.getThigh()}</label></td>
	</tr>
<tr>
				<td class="pro">Leg</td>
				<td class="phn">${previous.get(0).getLeg()}</td>
		<td class="ind"><label>${form.getLeg()}</label></td>
	</tr>
<tr>
				<td class="pro">Feet</td>
				<td class="phn">${previous.get(0).getFeet()}</td>
		<td class="ind"><label>${form.getFeet()}</label></td>
	</tr>
<tr>
				<td class="pro">Total Skin Score</td>
				<td class="phn">${previous.get(0).getSkinScore()}</td>
		<td class="ind"><label>${form.getSkinScore()}</label></td>
	</tr>

	
<tr><td><br><h4><br>Self-Assessment</h4></td></tr>
			<tr>
				<td class="pro">Cardiac/Pulmonary</td>
				<td class="phn"><label>${previous.get(0).getCardiacOrPulmonary()}</label></td>
			<td class="ind"><label>${form.getCardiacOrPulmonary()}</label></td>
			</tr>	


			<tr>
				<td class="pro">Gastrointestinal</td>
				<td class="phn"><label class="textareatable">${previous.get(0).getGastrointestinal()}</label></td>
		<td class="ind"><label class="textareatable">${form.getGastrointestinal()}</label></td>
			</tr>
			

			<tr>
				<td class="pro">Renal</td>
				<td class="phn"><label class="textareatable">${previous.get(0).getRenal()}</label></td>		
		<td class="ind"><label class="textareatable">${form.getRenal()}</label></td>
			</tr>				

<tr><td><br><h4>Meds/Plans<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getPlans()}</label></td>
		<td class="ind"><label class="textareatable">${form.getPlans()}</label></td>		
	</tr>
</table>
</c:when>











<c:when test="${previous.size() >= 2 }">
<table class="tablecontent">
	<tr>
					
		<th class="navblank">&nbsp;</th>
		<th class="pro"><a href="">${previous.get(0).getRevisionHistory().getDateCreated() }</a></th>
		<th class="phn"><a href="">${previous.get(1).getRevisionHistory().getDateCreated() }</a></th>
		<th class="ind"><a href="">${form.getRevisionHistory().getDateCreated()}</a></th>
	</tr>



	<tr>
		<td class="pro">Weight</td>
		<td class="phn"><label>${previous.get(0).getWeight() }</label></td>
		<td class="ind"><label>${previous.get(1).getWeight() }</label></td>
		<td class="web"><label>${form.getWeight()}</label></td>
	</tr>	
	
	<tr>
		<td class="pro">Blood Pressure</td>
		<td class="phn"><label>${previous.get(0).getBloodPressure() }</label></td>
		<td class="ind"><label>${previous.get(1).getBloodPressure() }</label></td>
		<td class="web"><label>${form.getBloodPressure()}</label></td>
			</tr>

<tr><td><br><h4>Labs/Other Data<br></h4></td></tr>
			
			<tr>
				<td class="pro">Hgb/Hct</td>
				<td class="phn">${previous.get(0).getHgbOrHct()}</td>
				<td class="ind">${form.get(1).getHgbOrHct()}</td>
		<td class="web"><label>${form.getHgbOrHct()}</label></td>
			</tr>	
<tr>
				<td class="pro">WBC</td>
				<td class="phn">${previous.get(0).getWBC()}</td>
				<td class="ind">${form.get(1).getWBC()}</td>
		<td class="web"><label>${form.getWBC()}</label></td>
			</tr>	
<tr>
				<td class="pro">Platelet</td>
				<td class="phn">${previous.get(0).getPlatelet()}</td>
				<td class="ind">${form.get(1).getPlatelet()}</td>
		<td class="web"><label>${form.getPlatelet()}</label></td>
			</tr>	
<tr>
				<td class="pro">ESR/CRP</td>
				<td class="phn">${previous.get(0).getESRorCRP()}</td>
				<td class="ind">${form.get(1).getESRorCRP()}</td>
		<td class="web"><label>${form.getESRorCRP()}</label></td>
			</tr>	
<tr>
				<td class="pro">ALT/AST</td>
				<td class="phn">${previous.get(0).getALTorAST()}</td>
				<td class="ind">${form.get(1).getALTorAST()}</td>
		<td class="web"><label>${form.getALTorAST()}</label></td>
			</tr>	
<tr>
				<td class="pro">Other Data</td>
				<td class="phn">${previous.get(0).getOtherData()}</td>
				<td class="ind">${form.get(1).getOtherData()}</td>
		<td class="web"><label>${form.getOtherData()}</label></td>
	</tr>

<tr><td><br><h4>Rodnan Skin Coloring<br></h4></td></tr>
<tr>
				<td class="pro">Face</td>
				<td class="phn">${previous.get(0).getFace()}</td>
				<td class="ind">${form.get(1).getFace()}</td>
		<td class="web"><label>${form.getFace()}</label></td>
	</tr>
<tr>
				<td class="pro">Anterior Chest</td>
				<td class="phn">${previous.get(0).getAnteriorChest()}</td>
				<td class="ind">${form.get(1).getAnteriorChest()}</td>
		<td class="web"><label>${form.getAnteriorChest)}</label></td>
	</tr>
<tr>
				<td class="pro">Upper Arm</td>
				<td class="phn">${previous.get(0).getUpperArm()}</td>
				<td class="ind">${form.get(1).getUpperArm()}</td>
		<td class="web"><label>${form.getUpperArm()}</label></td>
	</tr>
<tr>
				<td class="pro">Abdomen</td>
				<td class="phn">${previous.get(0).getAbdomen()}</td>
				<td class="ind">${form.get(1).getAbdomen()}</td>
		<td class="web"><label>${form.getAbdomen()}</label></td>
	</tr>
<tr>
				<td class="pro">Forearm</td>
				<td class="phn">${previous.get(0).getForeArm()}</td>
				<td class="ind">${form.get(1).getForeArm()}</td>
		<td class="web"><label>${form.getForeArm()}</label></td>
	</tr>
<tr>
				<td class="pro">Hand</td>
				<td class="phn">${previous.get(0).getHand()}</td>
				<td class="ind">${form.get(1).getHand()}</td>
		<td class="web"><label>${form.getHand()}</label></td>
	</tr>
<tr>
				<td class="pro">Fingers</td>
				<td class="phn">${previous.get(0).getFingers()}</td>
				<td class="ind">${form.get(1).getFingers()}</td>
		<td class="web"><label>${form.getFingers()}</label></td>
	</tr>
<tr>
				<td class="pro">Thigh</td>
				<td class="phn">${previous.get(0).getThigh()}</td>
				<td class="ind">${form.get(1).getThigh()}</td>
		<td class="web"><label>${form.getThigh()}</label></td>
	</tr>
<tr>
				<td class="pro">Leg</td>
				<td class="phn">${previous.get(0).getLeg()}</td>
				<td class="ind">${form.get(1).getLeg()}</td>
		<td class="web"><label>${form.getLeg()}</label></td>
	</tr>
<tr>
				<td class="pro">Feet</td>
				<td class="phn">${previous.get(0).getFeet()}</td>
				<td class="ind">${form.get(1).getFeet()}</td>
		<td class="web"><label>${form.getFeet()}</label></td>
	</tr>
<tr>
				<td class="pro">Total Skin Score</td>
				<td class="phn">${previous.get(0).getSkinScore()}</td>
				<td class="ind">${form.get(1).getSkinScore()}</td>
		<td class="web"><label>${form.getSkinScore()}</label></td>
	</tr>

	
<tr><td><br><h4>Cardiac/Pulmonary<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label>${previous.get(0).getCardiacOrPulmonary()}</label></td>
				<td class="ind"><label>${form.get(1).getCardiacOrPulmonary()}</label></td>
			<td class="web"><label>${form.getCardiacOrPulmonary()}</label></td>
			</tr>	


<tr><td><br><h4>Gastrointestinal<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getGastrointestinal()}</label></td>
				<td class="ind"><label class="textareatable">${form.get(1).getGastrointestinal()}</label></td>
		<td class="web"><label class="textareatable">${form.getGastrointestinal()}</label></td>
			</tr>
			
<tr><td><br><h4>Renal<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getRenal()}</label></td>
				<td class="ind"><label class="textareatable">${form.get(1).getRenal()}</label></td>
		<td class="web"><label class="textareatable">${form.getRenal()}</label></td>
			</tr>				

<tr><td><br><h4>Meds/Plans<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getPlans()}</label></td>
				<td class="ind"><label class="textareatable">${form.get(1).getPlans()}</label></td>
		<td class="web"><label class="textareatable">${form.getPlans()}</label></td>		
	</tr>
</table>
</c:when>
</c:choose>
</li>

</ul>
			
			
			</div>
			
					</section>
					<div class="lowernav1">
						<section class="paging">
							<ul>
							<c:if test="${ form.getRevisionHistory().getDateModified() != null}">
								<li><label>Date Modified</label>:  <span>${ form.getRevisionHistory().getDateModified() }</span></li>|
								<li><label>Modified By</label>:  <span>${ form.getRevisionHistory().getModifiedBy().getUsername() }</span></li>
							</c:if>
								<br/>
								<li><label>Date Created</label>:  <span>${ form.getRevisionHistory().getDateCreated() }</span></li>|
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