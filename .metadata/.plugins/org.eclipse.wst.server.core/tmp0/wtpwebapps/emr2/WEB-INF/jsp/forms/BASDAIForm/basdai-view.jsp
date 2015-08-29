<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>View BASDAI Form</title>
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
		<form:form commandName="form" action="BASDAI_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="edit_basdai.it" method="GET">
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
			<form:form commandName="form" action="delete_basdai.it" method="GET">
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
					<li>
					
						<p class="titles">The Bath Ankylosing Spondylitis Disease Activity Index (BASDAI)</p><br>
						
						<table class="tablecontent3">
								<tr>
									<th style="width:175px;">Generic Name</a></th>
									<th style="width:175px;">Brand Name</a></td>
									<th style="width:175px;">Dosage</a></td>
									<th style="width:175px;">Duration</a></td>
									<!-- <td class="pro"><a href="">Others</a></td>-->
								</tr>
							
								<tr>
									<td style="text-align:center;"> ${form.getASMedication().getGenericName()} </td>
									<td style="text-align:center;"> ${form.getASMedication().getBrandName()} </td>
									<td style="text-align:center;"> ${form.getASMedication().getDosage()} </td>
									<td style="text-align:center;"> ${form.getASMedication().getDuration()} </td>
										</tr>
						
						<br/>
						<br/>
						<table>
							<td class="pro"><h3>Effectiveness of Medication:</h3></td>
							<td class="php" cellpadding="10"> ${form.getMedicationEffectiveness()} </td>
						</table>
						<br/>
						<br>
						
						<table class="tablecontent3">
								<tr>
									<th class="pro" style="font-size:14px;"><a href="">Question</a></th>
									<th class="pro" style="font-size:14px;"><a href="">Score</a></td>
								</tr>
								
								<tr>
									<td align="left" class="pro" style="font-size:14px; text-align:left;">1. How would you describe the overall level of fatigue/tiredness you have experienced?</td>
									<td class="phn"><span>${ form.getQuestion1() }</span></td>
								</tr>
						
								<tr>
									<td class="pro" style="font-size:14px; text-align:left;">2. How would you describe the overall level of AS neck, back, or hip pain you have had?</td>
									<td class="phn" style="font-size:14px;"><span>${ form.getQuestion2() }</span></td>
								</tr>	
								
								<tr class="selected">
									<td class="pro" style="font-size:14px; text-align:left;">3. How would you describe the overall level of pain/swelling in joints other than neck, back, or hips you have had?</td>
									<td class="phn" style="font-size:14px;"><span>${ form.getQuestion3() }</span></td>
								</tr>	
								
								<tr>
									<td class="pro" style="font-size:14px; text-align:left;">4. How would you describe the overall level of discomfort you have had from any areas tender to touch or pressure?</td>
									<td class="phn" style="font-size:14px;"><span>${ form.getQuestion4() }</span></td>
								</tr>	
								
								<tr>
									<td class="pro" style="font-size:14px; text-align:left;">5. How would you describe the overall level of discomfort you have had from the time you wake up?</td>
									<td class="phn" style="font-size:14px;"><span>${ form.getQuestion5() }</span></td>
								</tr>

								<tr>
									<td class="pro" style="font-size:14px; text-align:left;">6. How long does your morning stiffness last from the time you wake up?</td>
									<td class="phn" style="font-size:14px;"><span>${ form.getQuestion6() }</span></td>
								</tr>		
								<tr>
									<td class="pro" style="font-size:14px; text-align:left;">TOTAL OF 1 TO 4 ADDED TO MEAN OF 5 AND 6 (TOTAL OUT OF 50) </td>
									<td class="phn" style="font-size:14px;"><span>${ form.getTotal() }</span></td>
								</tr>
								<tr>
									<td class="pro" style="font-size:14px; text-align:left;">BASDAI SCORE(total/5)</td>
									<td class="phn" style="font-size:14px;"><span>${ form.getScore() }</span></td>
								</tr>
							</table>
					</li>			
				<br/><br/><br/><br/><br/><br/>
			
			<h4>BASDAI Score Calculation</h4>
					<p>Scores from all questions are calculated using a ruler. The measurement (score) of questions
					5 and 6 is added to the scores from questions 1 to 4. This total is then divided by 5 to give the average.
					This is the BASDAI score. The higher the BASDAI score, the more severe the patient's disability due to their AS.</p>		
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