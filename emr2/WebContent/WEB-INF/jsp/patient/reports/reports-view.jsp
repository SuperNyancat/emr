<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>Patient Reports</title>
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

			<p class="titles">Patient Reports</p> <br><br>
			<span>Year:</span>
			<form action="view_reports.it">
				<input type="hidden" name="id" value="${patient.getId() }"/>
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
			<input type="submit" value="Go"><br><br>
			</form>
			<br>
			
			
			<h4>Patient Encounters Summary for <span>${year }</span></h4>
			<p><i>* History Updates and Check-Up Sessions Report *</i></p>
			<br>
		<div style="overflow: scroll; height:700px;">	
			<table class="tablecontent">

			<tr>
				<th class="phn">Month</th>
				<th class="phn">History Update<br>Count</th>
				<th class="phn">Check-Up Sessions<br>Count</th>
			</tr>
	<c:forEach items="${patientCountForms }" var="form" varStatus="i">
			
		<tr>
			<td class="phn"><span><strong>${form.key }</strong></span></td>
			
			
		<c:choose>
			<c:when test="${histoForms[i.index] == 0}">
				<td class="phn">-</td>
			</c:when>
			<c:otherwise>
				<td class="phn"><span>Visited the hospital <strong>${histoForms[i.index] }</strong> times.   | <a href="uh_report.it?id=${patient.getId() }&m=${form.key }&y=${year}">view details</a></span></td>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${form.value == 0}">
				<td class="phn">-</td>
			</c:when>
			<c:otherwise>
				<td class="phn"><span><strong>${form.value }</strong> forms   |   <a href="visit_details.it?id=${patient.getId() }&m=${form.key }&y=${year}">view details</a></span></td>
			</c:otherwise>
		</c:choose>
			
		</tr>
	
	</c:forEach>
			
		
			</table>
</div><br><br><br><br>
		
		
		
		
		<!-- Forms Count -->
					<h4>Forms Count for <span>${year }</span></h4>
					<p>Monthly view of the number of filled-up forms for the year.</p>
					<p><i>*Click on the form for more details </i></p>
					
					
					<br><br>
					<div style="overflow: scroll; height:600px;">
					
					
					<table class="tablecontent">						
						<tr>
							<th class="phn"></th>
							<th class="phn" style="width:50px;">JAN</th>
							<th class="phn" style="width:50px;">FEB</th>
							<th class="phn" style="width:50px;">MAR</th>
							<th class="phn" style="width:50px;">APR </th>
							<th class="phn" style="width:50px;">MAY</th>
							<th class="phn" style="width:50px;">JUN</th>
							<th class="phn" style="width:50px;">JUL</th>
							<th class="phn" style="width:50px;">AUG</th>
							<th class="phn" style="width:50px;">SEPT</th>
							<th class="phn" style="width:50px;">OCT</th>
							<th class="phn" style="width:50px;">NOV</th>
							<th class="phn" style="width:50px;">DEC</th>
						</tr>
						
						
					
			<tr>
				<td class="phn"><span>SLICC Damage Score</span></td>
					<c:forEach items="${damageForms }" var="form">
						<c:choose>
							<c:when test="${form.value == 0}">
								<td class="phn">-</td>
							</c:when>
							<c:otherwise>
								<td class="phn"><strong><a href="damage_reports.it?id=${patient.getId() }&m=${form.key}&y=${year}">${form.value }</a></strong></td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</tr>
			
			<tr>
							<td class="phn"><span>MEX SLEDAI Score</span></td>
					<c:forEach items="${mexForms }" var="form">
						<c:choose>
							<c:when test="${form.value == 0}">
								<td class="phn">-</td>
							</c:when>
							<c:otherwise>
								<td class="phn"><strong><a href="mex_reports.it?id=${patient.getId() }&m=${form.key}&y=${year}">${form.value }</a></strong></td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</tr>
			
			<tr>
							<td class="phn"><span>SLEDAI Score</span></td>
					<c:forEach items="${sledaiForms }" var="form">
						<c:choose>
							<c:when test="${form.value == 0}">
								<td class="phn">-</td>
							</c:when>
							<c:otherwise>
								<td class="phn"><strong><a href="sledai_reports.it?id=${patient.getId() }&m=${form.key}&y=${year}">${form.value }</a></strong></td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</tr>
			
			<tr>
							<td class="phn"><span>BASDAI Score</span></td>
					<c:forEach items="${basdaiForms }" var="form">
						<c:choose>
							<c:when test="${form.value == 0}">
								<td class="phn">-</td>
							</c:when>
							<c:otherwise>
								<td class="phn"><strong><a href="basdai_reports.it?id=${patient.getId() }&m=${form.key}&y=${year}">${form.value }</a></strong></td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</tr>
			
			<tr>
							<td class="phn"><span>BASFI Score</span></td>
					<c:forEach items="${basfiForms }" var="form">
						<c:choose>
							<c:when test="${form.value == 0}">
								<td class="phn">-</td>
							</c:when>
							<c:otherwise>
								<td class="phn"><strong><a href="basfi_reports.it?id=${patient.getId() }&m=${form.key}&y=${year}">${form.value }</a></strong></td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</tr>
			
			<tr>
							<td class="phn"><span>BAS-G Score</span></td>
					<c:forEach items="${basgForms }" var="form">
						<c:choose>
							<c:when test="${form.value == 0}">
								<td class="phn">-</td>
							</c:when>
							<c:otherwise>
								<td class="phn"><strong><a href="basg_reports.it?id=${patient.getId() }&m=${form.key}&y=${year}">${form.value }</a></strong></td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</tr>
			
			
</table>
</div><br><br>
					</section>
					

				</div>
			</div>
		</form>
		
	</div>
	</div>
		
</div>
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>
</body>
</html>