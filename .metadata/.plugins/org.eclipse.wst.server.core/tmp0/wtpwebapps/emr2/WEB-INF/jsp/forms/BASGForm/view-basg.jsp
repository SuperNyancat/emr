<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>BAS-G Form</title>
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
		<form:form commandName="form" action="BASG_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="edit_basg.it" method="GET">
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
			<form:form commandName="form" action="delete_basg.it" method="GET">
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
						
						<p class="titles">The Bath Ankylosing Sponylitis Global Score</p><br><br>
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
									<td align="left" class="pro">1. How have you been over the last week?</td>
									<td class="phn"><span>${ form.getQuestion1() }</span></td>
								</tr>
						
								<tr>
									<td class="pro">2. How have you been over the last six months?</td>
									<td class="phn"><span>${ form.getQuestion2() }</span></td>
								</tr>		
								<tr>
									<td class="pro">TOTAL OUT OF 20</td>
									<td class="phn"><span>${ form.getTotal() }</span></td>
								</tr>
								<tr>
									<td class="pro">BAS-G SCORE (total/20)</td>
									<td class="phn"><span>${ form.getScore() }</span></td>
								</tr>
							</table>
					</li>	
					<br><br><br><br><br><br>
					
					<h4>BAS-G Score Calculation</h4>
					<p>Scores from the 2 questions are calculated using a ruler and added. This figure is divided
					by 2 to obtain an average. This is the BAS-G score. The higher the BAS-G score, the more severe the effect of 
					AS on the patient's life.</p>		
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