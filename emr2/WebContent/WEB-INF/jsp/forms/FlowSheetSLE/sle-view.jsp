<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>View SLE Flowsheet Form</title>
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
		<form:form commandName="form" action="SLE_flowsheet_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="edit_sle_flowsheet.it" method="GET">
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
			<form:form commandName="form" action="delete_sle.it" method="GET">
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

				<p class="titles"> Systemic Lupus Erythematosus Flow Sheet</p><br><br>
	
				
			<ul>

<li>


<c:choose>
<c:when test="${previous == null || previous.size() == 0}">
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
				<td class="pro">WBC</td>
		<td class="web"><label>${form.getWBC()}</label></td>
			</tr>	
<tr>
				<td class="pro">Platelet/ESR</td>
		<td class="web"><label>${form.getPlateletOrESR()}</label></td>
			</tr>	
<tr>
				<td class="pro">Urine Protein</td>
		<td class="web"><label>${form.getUrineProtein()}</label></td>
			</tr>	
<tr>
				<td class="pro">RBC</td>
		<td class="web"><label>${form.getRBC()}</label></td>
			</tr>	
<tr>
				<td class="pro">WBC</td>
		<td class="web"><label>${form.getUrineWBC()}</label></td>
	</tr>
<tr>
				<td class="pro">Casts</td>
		<td class="web"><label>${form.getCasts()}</label></td>
	</tr>	
<tr>
				<td class="pro">Others</td>
		<td class="web"><label>${form.getUrineOthers()}</label></td>
	</tr>
<tr>
				<td class="pro">Creatinine/CrCl</td>
		<td class="web"><label>${form.getCrCl()}</label></td>
	</tr>
<tr>
				<td class="pro">C3</td>
		<td class="web"><label>${form.getC3()}</label></td>
	</tr>

<tr><td><br><h4>Clinical Data<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
			<td class="web"><label>${form.getClinicalData()}</label></td>
			</tr>	


<tr><td><br><h4>SLEDAI etc.<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
		<td class="web"><label class="textareatable">${form.getSLEDAI()}</label></td>
			</tr>		

<tr><td><br><h4>Meds/Plans<br></h4></td></tr>
<tr>
				<td class="pro"></td>
		<td class="web"><label class="textareatable">${form.getPlans()}</label></td>		
	</tr>

<tr><td><br><h4>Pred/methylpred<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
		<td class="web"><label class="textareatable">${form.getMethylpred()}</label></td>		
	</tr>
<tr><td><br><h4>Hydroxychloroquine<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
		<td class="web"><label class="textareatable">${form.getHydroxychloroquine()}</label></td>		
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
				<td class="pro">WBC</td>
				<td class="phn"><label>${previous.get(0).getWBC() }</label></td>
		<td class="web"><label>${form.getWBC()}</label></td>
			</tr>	
<tr>
				<td class="pro">Platelet/ESR</td>
				<td class="phn"><label>${previous.get(0).getPlateletOrESR() }</label></td>
		<td class="web"><label>${form.getPlateletOrESR()}</label></td>
			</tr>	
<tr>
				<td class="pro">Urine Protein</td>
				<td class="phn"><label>${previous.get(0).getUrineProtein() }</label></td>
		<td class="web"><label>${form.getUrineProtein()}</label></td>
			</tr>	
<tr>
				<td class="pro">RBC</td>
				<td class="phn"><label>${previous.get(0).getRBC() }</label></td>
		<td class="web"><label>${form.getRBC()}</label></td>
			</tr>	
<tr>
				<td class="pro">WBC</td>
				<td class="phn"><label>${previous.get(0).getUrineWBC() }</label></td>
		<td class="web"><label>${form.getUrineWBC()}</label></td>
	</tr>
<tr>
				<td class="pro">Casts</td>
				<td class="phn"><label>${previous.get(0).getCasts() }</label></td>
		<td class="web"><label>${form.getCasts()}</label></td>
	</tr>		
<tr>
				<td class="pro">Others</td>
				<td class="phn"><label>${previous.get(0).getUrineOthers() }</label></td>
		<td class="web"><label>${form.getUrineOthers()}</label></td>
	</tr>	
<tr>
				<td class="pro">Creatinine/CrCl</td>
				<td class="phn"><label>${previous.get(0).getCrCl() }</label></td>
		<td class="web"><label>${form.getCrCl()}</label></td>
	</tr>		
<tr>
				<td class="pro">C3</td>
				<td class="phn"><label>${previous.get(0).getC3() }</label></td>
		<td class="web"><label>${form.getC3()}</label></td>
	</tr>		


<tr><td><br><h4>Clinical Data<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label>${previous.get(0).getClinicalData() }</label></td>
		<td class="web"><label>${form.getClinicalData()}</label></td>
			</tr>	


<tr><td><br><h4>SLEDAI etc.<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getSLEDAI() }</label></td>
		<td class="web"><label class="textareatable">${form.getSLEDAI()}</label></td>
			</tr>		

<tr><td><br><h4>Meds/Plans<br></h4></td></tr>
<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getPlans() }</label></td>
		<td class="web"><label class="textareatable">${form.getPlans()}</label></td>
		</tr>
<tr><td><br><h4>Pred/Methylpred<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getMethylpred() }</label></td>
		<td class="web"><label class="textareatable">${form.getMethylpred()}</label></td>		
	</tr>			
</table>

<tr><td><br><h4>Hydroxychloroquine<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getHydroxychloroquine() }</label></td>
		<td class="web"><label class="textareatable">${form.getHydroxychloroquine()}</label></td>		
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
				<td class="pro">WBC</td>
				<td class="phn"><label>${previous.get(0).getWBC() }</label></td>
		<td class="ind"><label>${previous.get(1).getWBC() }</label></td>
		<td class="web"><label>${form.getWBC()}</label></td>
			</tr>	
<tr>
				<td class="pro">Platelet/ESR</td>
				<td class="phn"><label>${previous.get(0).getPlateletOrESR() }</label></td>
		<td class="ind"><label>${previous.get(1).getPlateletOrESR() }</label></td>
		<td class="web"><label>${form.getPlateletOrESR()}</label></td>
			</tr>	
<tr>
				<td class="pro">Urine Protein</td>
				<td class="phn"><label>${previous.get(0).getUrineProtein() }</label></td>
		<td class="ind"><label>${previous.get(1).getUrineProtein() }</label></td>
		<td class="web"><label>${form.getUrineProtein()}</label></td>
			</tr>	
<tr>
				<td class="pro">RBC</td>
				<td class="phn"><label>${previous.get(0).getRBC() }</label></td>
		<td class="ind"><label>${previous.get(1).getRBC() }</label></td>
		<td class="web"><label>${form.getRBC()}</label></td>
			</tr>	
<tr>
				<td class="pro">WBC</td>
				<td class="phn"><label>${previous.get(0).getUrineWBC() }</label></td>
		<td class="ind"><label>${previous.get(1).getUrineWBC() }</label></td>
		<td class="web"><label>${form.getUrineWBC()}</label></td>
	</tr>
<tr>
				<td class="pro">Casts</td>
				<td class="phn"><label>${previous.get(0).getCasts() }</label></td>
		<td class="ind"><label>${previous.get(1).getCasts() }</label></td>
		<td class="web"><label>${form.getCasts()}</label></td>
	</tr>
<tr>
				<td class="pro">Others</td>
				<td class="phn"><label>${previous.get(0).getUrineOthers() }</label></td>
		<td class="ind"><label>${previous.get(1).getUrineOthers() }</label></td>
		<td class="web"><label>${form.getUrineOthers()}</label></td>
	</tr>
<tr>
				<td class="pro">Creatinine/CrCl</td>
				<td class="phn"><label>${previous.get(0).getCrCl() }</label></td>
		<td class="ind"><label>${previous.get(1).getCrCl() }</label></td>
		<td class="web"><label>${form.getCrCl()}</label></td>
	</tr>
<tr>
				<td class="pro">C3</td>
				<td class="phn"><label>${previous.get(0).getC3() }</label></td>
		<td class="ind"><label>${previous.get(1).getC3() }</label></td>
		<td class="web"><label>${form.getC3()}</label></td>
	</tr>	

<tr><td><br><h4>Clinical Data<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label>${previous.get(0).getClinicalData() }</label></td>
		<td class="ind"><label>${previous.get(1).getClinicalData() }</label></td>
		<td class="web"><label>${form.getClinicalData()}</label></td>
			</tr>	


<tr><td><br><h4>SLEDAI etc.<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getSLEDAI() }</label></td>
		<td class="ind"><label class="textareatable">${previous.get(1).getSLEDAI() }</label></td>
		<td class="web"><label class="textareatable">${form.getSLEDAI()}</label></td>
			</tr>		

<tr><td><br><h4>Meds/Plans<br></h4></td></tr>
<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getPlans() }</label></td>
		<td class="ind"><label class="textareatable">${previous.get(1).getPlans() }</label></td>
		<td class="web"><label class="textareatable">${form.getPlans()}</label></td>	
<tr><td><br><h4>Pred/Methylpred<br></h4></td></tr>
			<tr>
				<td class="pro"></td>
				<td class="phn"><label class="textareatable">${previous.get(0).getMethylpred() }</label></td>
		<td class="ind"><label class="textareatable">${previous.get(1).getMethylpred() }</label></td>
		<td class="web"><label class="textareatable">${form.getMethylpred()}</label></td>		
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