<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>View Inflammatory Myopathy Form</title>
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
		<form:form commandName="form" action="inflammatory_myopath_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="edit_myopath.it" method="GET">
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
			<form:form commandName="form" action="delete_myopath.it" method="GET">
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

				<p class="titles"> Inflammatory Myopathy Flow Sheet</p><br><br>
	
				
			<ul>

<li>


<c:choose>
<c:when test="${previous==null || previous.size() == 0}">
<table class="tablecontent">
	<tr>
					
		<th class="navblank">&nbsp;</th>
		<th class="ind"><a href="">${form.getRevisionHistory().getDateCreated()}</a></th>
	</tr>


	<tr>
		<td class="pro">Weight</td>
		<td class="web"><label>${form.getWeight()}</label></td>
	</tr>	
	
	<tr>
		<td class="pro">Blood Pressure</td>
		<td class="web"><label>${form.getBloodPressure()}</label></td>
			</tr>

<tr><td><br><h4>Labs/Other Data<br></h4></td></tr>
			
			<tr>
				<td class="pro">Hgb/Hct</td>
		<td class="web"><label>${form.getHgbOrHct()}</label></td>
			</tr>	
<tr>
				<td class="pro">WBC/Platelet</td>
		<td class="web"><label>${form.getWBCOPlatelet()}</label></td>
			</tr>	
<tr>
				<td class="pro">ESR</td>
		<td class="web"><label>${form.getESR()}</label></td>
			</tr>	
<tr>
				<td class="pro">ALT/AST</td>
		<td class="web"><label>${form.getALTOrAST()}</label></td>
			</tr>	
<tr>
				<td class="pro">SLDH</td>
		<td class="web"><label>${form.getSLDH()}</label></td>
			</tr>	
<tr>
				<td class="pro">TCK/CKMM</td>
		<td class="web"><label>${form.getTCKorCKMM()}</label></td>
	</tr>	


	<tr>
		<td class="pro">Other Data</td>
		<td class="web"><label>${form.getOtherData()}</label></td>		
			</tr>

<tr><td><br><h4>Clinical Data<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
			<td class="web"><label>${form.getClinicalData()}</label></td>
			</tr>	


<tr><td><br><h4>Self-Assessment<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
		<td class="web"><label class="textareatable">${form.getVAS()}</label></td>
			</tr>		

<tr><td><br><h4>Meds/Plans<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
		<td class="web"><label class="textareatable">${form.getPlans()}</label></td>		
	</tr>			
</table>



</c:when>








<c:when test="${previous.size() == 1 }">
<table class="tablecontent">
	<tr>
					
		<th class="navblank">&nbsp;</th>
		<th class="pro"><a href="">${previous.get(0).getRevisionHistory().getDateCreated() }</a></th>
		<th class="ind"><a href="">${form.getRevisionHistory().getDateCreated()}</a></th>
	</tr>


	<tr>
		<td class="pro">Weight</td>
		<td class="phn"><label>${previous.get(0).getWeight() }</label></td>
		<td class="web"><label>${form.getWeight()}</label></td>
	</tr>	
	
	<tr>
		<td class="pro">Blood Pressure</td>
		<td class="phn"><label>${previous.get(0).getBloodPressure() }</label></td>
		<td class="web"><label>${form.getBloodPressure()}</label></td>
			</tr>

<tr><td><br><h4>Labs/Other Data<br></h4></td></tr>
			
			<tr>
				<td class="pro">Hgb/Hct</td>
				<td class="phn"><label>${previous.get(0).getHgbOrHct() }</label></td>
		<td class="web"><label>${form.getHgbOrHct()}</label></td>
			</tr>	
<tr>
				<td class="pro">WBC/Platelet</td>
				<td class="phn"><label>${previous.get(0).getWBCOPlatelet() }</label></td>
		<td class="web"><label>${form.getWBCOPlatelet()}</label></td>
			</tr>	
<tr>
				<td class="pro">ESR</td>
				<td class="phn"><label>${previous.get(0).getESR() }</label></td>
		<td class="web"><label>${form.getESR()}</label></td>
			</tr>	
<tr>
				<td class="pro">ALT/AST</td>
				<td class="phn"><label>${previous.get(0).getALTOrAST() }</label></td>
		<td class="web"><label>${form.getALTOrAST()}</label></td>
			</tr>	
<tr>
				<td class="pro">SLDH</td>
				<td class="phn"><label>${previous.get(0).getSLDH() }</label></td>
		<td class="web"><label>${form.getSLDH()}</label></td>
			</tr>	
<tr>
				<td class="pro">TCK/CKMM</td>
				<td class="phn"><label>${previous.get(0).getTCKorCKMM() }</label></td>
		<td class="web"><label>${form.getTCKorCKMM()}</label></td>
	</tr>	


	<tr>
		<td class="pro">Other Data</td>
		<td class="phn"><label>${previous.get(0).getOtherData() }</label></td>
		<td class="web"><label>${form.getOtherData()}</label></td>		
			</tr>

<tr><td><br><h4>Clinical Data<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label>${previous.get(0).getClinicalData() }</label></td>
		<td class="web"><label>${form.getClinicalData()}</label></td>
			</tr>	


<tr><td><br><h4>Self-Assessment<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getVAS() }</label></td>
		<td class="web"><label class="textareatable">${form.getVAS()}</label></td>
			</tr>		

<tr><td><br><h4>Meds/Plans<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getPlans() }</label></td>
		<td class="web"><label class="textareatable">${form.getPlans()}</label></td>		
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
				<td class="phn"><label>${previous.get(0).getHgbOrHct() }</label></td>
		<td class="ind"><label>${previous.get(1).getHgbOrHct() }</label></td>
		<td class="web"><label>${form.getHgbOrHct()}</label></td>
			</tr>	
<tr>
				<td class="pro">WBC/Platelet</td>
				<td class="phn"><label>${previous.get(0).getWBCOPlatelet() }</label></td>
		<td class="ind"><label>${previous.get(1).getWBCOPlatelet() }</label></td>
		<td class="web"><label>${form.getWBCOPlatelet()}</label></td>
			</tr>	
<tr>
				<td class="pro">ESR</td>
				<td class="phn"><label>${previous.get(0).getESR() }</label></td>
		<td class="ind"><label>${previous.get(1).getESR() }</label></td>
		<td class="web"><label>${form.getESR()}</label></td>
			</tr>	
<tr>
				<td class="pro">ALT/AST</td>
				<td class="phn"><label>${previous.get(0).getALTOrAST() }</label></td>
		<td class="ind"><label>${previous.get(1).getALTOrAST() }</label></td>
		<td class="web"><label>${form.getALTOrAST()}</label></td>
			</tr>	
<tr>
				<td class="pro">SLDH</td>
				<td class="phn"><label>${previous.get(0).getSLDH() }</label></td>
		<td class="ind"><label>${previous.get(1).getSLDH() }</label></td>
		<td class="web"><label>${form.getSLDH()}</label></td>
			</tr>	
<tr>
				<td class="pro">TCK/CKMM</td>
				<td class="phn"><label>${previous.get(0).getTCKorCKMM() }</label></td>
		<td class="ind"><label>${previous.get(1).getTCKorCKMM() }</label></td>
		<td class="web"><label>${form.getTCKorCKMM()}</label></td>
	</tr>	


	<tr>
		<td class="pro">Other Data</td>
		<td class="phn"><label>${previous.get(0).getOtherData() }</label></td>
		<td class="ind"><label>${previous.get(1).getOtherData() }</label></td>
		<td class="web"><label>${form.getOtherData()}</label></td>		
			</tr>

<tr><td><br><h4>Clinical Data<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label>${previous.get(0).getClinicalData() }</label></td>
		<td class="ind"><label>${previous.get(1).getClinicalData() }</label></td>
		<td class="web"><label>${form.getClinicalData()}</label></td>
			</tr>	


<tr><td><br><h4>Self-Assessment<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getVAS() }</label></td>
		<td class="ind"><label class="textareatable">${previous.get(1).getVAS() }</label></td>
		<td class="web"><label class="textareatable">${form.getVAS()}</label></td>
			</tr>		

<tr><td><br><h4>Meds/Plans<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getPlans() }</label></td>
		<td class="ind"><label class="textareatable">${previous.get(1).getPlans() }</label></td>
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