<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
	<title>${formName } Report</title>
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
	
	<div class="wrapper">		

	
	<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="reports" />
			</jsp:include>
	
		<form class="crmForm">
			<div class="tab-content">
			
				<div id="Medication and Prescription" class="tab active">
					<section class="settingBody clrfix">		
			<div class = "left">
				<jsp:include page="../../headers/patient-left.jsp" />
			</div>
						<div class="right">

<p class="titles">Forms Count for ${year }</p> <br><br>

				<h4>${formName } Scores for the month of <span>${monthWord }</span></h4>
				<form action="search_report_forms.it">
				
				<ul class="pro">
					<input type="hidden" name="id" value="${patient.getId() }"/>
					<input type="hidden" name="f" value="${entityName }" />
					<li><span>Year:</span>
									<select name="y">
										<option hidden="Year"></option>
										<option value="2030">2030</option>
										<option value="2029">2029</option>
										<option value="2028">2028</option>
										<option value="2027">2027</option>
										<option value="2026">2026</option>
										<option value="2025">2025</option>
										<option value="2024">2024</option>
										<option value="2023">2023</option>
										<option value="2022">2022</option>
										<option value="2021">2021</option>
										<option value="2020">2020</option>
										<option value="2019">2019</option>
										<option value="2018">2018</option>
										<option value="2017">2017</option>
										<option value="2016">2016</option>
										<option value="2015">2015</option>
										<option value="2014">2014</option>
										
									</select>
					<span>Month:</span>									 
									<select name="m">
										<option hidden="Month"></option>
										<option value="01">January</option>
										<option value="02">February</option>
										<option value="03">March</option>
										<option value="04">April</option>
										<option value="05">May</option>
										<option value="06">June</option>
										<option value="07">July</option>
										<option value="08">August</option>
										<option value="09">September</option>
										<option value="10">October</option>
										<option value="11">November</option>
										<option value="12">December</option>
									</select> <input type="submit" value="Go"></li><br><br>
				</ul>
				</form>
				<br><br><br>
	<c:choose>
	<c:when test="${errorMessage!=null }">
		<font color="red" size="5px">${errorMessage}</font>
		<c:remove var="errorMessage" scope="session" />
	</c:when>
	<c:otherwise>
	<div style="overflow-x: scroll; height:140px;">
	
	<table class="tablecontent">						
		<tr>
			<th class="phn">${formName }</th>
			<c:forEach items="${forms }" var="f">
				<th class="phn">${f.getRevisionHistory().getDateCreated() }</th>
			</c:forEach>
		</tr>
					
					
					
		<tr>
			<th class="phn"><span>SCORES</span></th>
			<c:forEach items="${forms }" var="f">
			<td class="phn"><span>
				<c:choose>
					<c:when test="${formName.contains('Damage') }">
						<a href="view_damage_index.it?pid=${patient.id }&fid=${f.id}">
					</c:when>
					
					<c:when test="${formName.contains('MEX') }">
						<a href="view_MEXSLEDAI.it?pid=${patient.id }&fid=${f.id}">
					</c:when>
					
					<c:when test="${formName.contains('SLEDAI') }">
						<a href="view_sledai_score.it?pid=${patient.id }&fid=${f.id}">
					</c:when>
					
					<c:when test="${formName.contains('BASDAI') }">
						<a href="view_basdai.it?pid=${patient.id }&fid=${f.id}">
					</c:when>
					
					<c:when test="${formName.contains('BASFI') }">
						<a href="view_basfi.it?pid=${patient.id }&fid=${f.id}">
					</c:when>
					
					<c:when test="${formName.contains('BAS-G') }">
						<a href="view_basg.it?pid=${patient.id }&fid=${f.id}">
					</c:when>
					
				</c:choose>
			
			
				${f.getScore() }</a></span></td>
			</c:forEach>						
		</tr>
</table>
</div>
	<br><br>

</c:otherwise>
	</c:choose>

</div>
<br><br>
			
		</div>
		</div></form>
	</div>
	</div>
<footer>	
	<span class="copy"><a href="#">&copy; 2014 Pendragons</a></span>
</footer>


</div>

</body>
</html>