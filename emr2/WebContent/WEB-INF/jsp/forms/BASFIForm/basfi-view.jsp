<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>View BASFI Form</title>
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
		<form:form commandName="form" action="BASFI_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="edit_basfi.it" method="GET">
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
			<form:form commandName="form" action="delete_basfi.it" method="GET">
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
						
						<p class="titles">The Bath Ankylosing Spondylitis Functional Index (BASFI)</p><br>
						<div class="tableHeadertranscase clrfix">
							<table border="0" class="navigation">
								<tr>
									<td class="pro"><a href="">Question</a></th>
									<td class="phn"><a href="">Score</a></td>
								</tr>
							</table>
						</div>

							<table class="tableContenttranscase">	
								<tr>
									<td align="left" class="pro">1. Putting on your socks or tights without help or aids (e.g. sock aid)?</td>
									<td class="phn"><span>${ form.getQuestion1() }</span></td>
								</tr>
						
								<tr>
									<td class="pro">2. Bending forward from the waist to pick up a pen from the floor without an aid?</td>
									<td class="phn"><span>${ form.getQuestion2() }</span></td>
								</tr>	
								
								<tr class="selected">
									<td class="pro">3. Reaching up to a high shelf without help or aids (e.g. Helping Hand)?</td>
									<td class="phn"><span>${ form.getQuestion3() }</span></td>
								</tr>	
								
								<tr>
									<td class="pro">4. Getting out of an arm-less dining chair without using your hands or any help?</td>
									<td class="phn"><span>${ form.getQuestion4() }</span></td>
								</tr>	
								
								<tr>
									<td class="pro">5. Getting up of the floor - without help - from lying on your back?</td>
									<td class="phn"><span>${ form.getQuestion5() }</span></td>
								</tr>

								<tr>
									<td class="pro">6. Standing unsupported for ten minutes without discomfort?</td>
									<td class="phn"><span>${ form.getQuestion6() }</span></td>
								</tr>			
								
								<tr>
									<td class="pro">7. Bending forward from the waist to pick up a pen from the floor without an aid?</td>
									<td class="phn"><span>${ form.getQuestion7() }</span></td>
								</tr>		
								
								<tr>
									<td class="pro">8. Looking over your shoulder without turning your body?</td>
									<td class="phn"><span>${ form.getQuestion8() }</span></td>
								</tr>		
								
								<tr>
									<td class="pro">9. Doing physically demanding activities (e.g. physio exercises, gardening, sport)?</td>
									<td class="phn"><span>${ form.getQuestion9() }</span></td>
								</tr>		
								
								<tr>
									<td class="pro">10. Doing a full day's activities at home or at work?</td>
									<td class="phn"><span>${ form.getQuestion10() }</span></td>
								</tr>	
								
								<tr>
									<td class="pro">TOTAL OUT OF 100</td>
									<td class="phn"><span>${ form.getTotal() }</span></td>
								</tr>
								
								<tr>
									<td class="pro">BASFI SCORE (total/10)</td>
									<td class="phn"><span>${ form.getBASFIScore() }</span></td>
								</tr>
								
							</table>
					<br/><br/><br/><br/><br/><br/>
			
			<h4>BASFI Score Calculation</h4>
					<p>Scores from all questions are calculated using a ruler and added. This figure is divided by 10 to obtain an average.
					This is the BASFI score. the higher the BASFI score, the more severe the patient's limitation of function due to their AS.</p>		
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