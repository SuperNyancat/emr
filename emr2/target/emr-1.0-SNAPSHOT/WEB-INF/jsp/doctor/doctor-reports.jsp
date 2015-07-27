<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
</head>

<body>

<div id="wrap">
<jsp:include page="../headers/doctor-header.jsp">
	<jsp:param name="title" value="Doctor Reports" />
	<jsp:param name="selected" value="reports" />
</jsp:include>

<div class="pageCtrl">
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	<div class="wrapper">	
		<div class="tabs">
			<div class="tab-content">
				<div id="History" class="tab active">           
					<section class="settingBody clrfix">		
						
			
						<div style="width:1000px;padding-left:36px;">

<p class="titles"><br><br>Doctor Reports</p> <br><br><br>

<c:if test="${successMessage != null }">
	<div class="success">${successMessage}</div>
	<c:remove var="successMessage" scope="session" /> 
</c:if>

<h4 style="color:goldenrod; font-size:14px; text-decoration:underline;" >Number of Patients for ${year }</h4><br>
<span>Year:</span>
		<form action="view_doctor_reports.it">
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
			</form><br/>
<div style="overflow: scroll; height:120px;">
<table class="tablecontent">						
		<tr>
			<th class="phn"></th>
			<th class="phn" style="width:80px">January</th>
			<th class="phn" style="width:80px">February</th>
			<th class="phn" style="width:80px">March</th>
			<th class="phn" style="width:80px">April</th>			
			<th class="phn" style="width:80px">May</th>
			<th class="phn" style="width:80px">June</th>
			<th class="phn" style="width:80px">July</th>
			<th class="phn" style="width:80px">August</th>
			<th class="phn" style="width:80px">September</th>
			<th class="phn" style="width:80px">October</th>			
			<th class="phn" style="width:80px">November</th>			
			<th class="phn" style="width:80px">December</th>
		</tr>
		<tr>
			<th class="phn"><span>NO. OF PATIENTS</span></th>
			<c:forEach items="${patientCount }" var="form">	
				
		<c:choose>
			<c:when test="${form.value == 0}">
				<td class="phn">-</td>
			</c:when>
			<c:otherwise>
				<td class="phn"><span><strong>${form.value }</strong></span></td>
			</c:otherwise>
		</c:choose>			
			</c:forEach>
		</tr>
		<c:if test="${errorMessagePatientCount != null }">
			<td><div class="info">${errorMessagePatientCount}</div>
			<c:remove var="errorMessagePatientCount" scope="session" /></td> 
		</c:if>
</table>
</div><br><br>


										
<h4 style="color:goldenrod; font-size:14px; text-decoration:underline;" >Disabled Patients for ${year }</h4><br>
	<span>Year:</span>
		<form action="view_doctor_reports.it">
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
			</form><br/>
	
	
<div style="overflow: scroll; height:300px;">	
<table class="tablecontent">

		<tr>
			<th class="phn">Patient</th>
			<th class="phn">Date Disabled</th>
			<th class="phn">Action</th>
		</tr>
		
		<c:forEach items="${disabledPatients }" var="dp">
			<tr>
				<td class="phn"><span>${dp.getPersonInfo().getFirstName()} ${dp.getPersonInfo().getLastName() }</span></td>
				<td class="phn"><span>${dp.getPersonInfo().getRevisionHistory().getDateDeleted() }</span></td>
				<td class="phn"><span class="btn"><a href="enable_patient.it?id=${dp.getId() }"><input type="button" value="Enable" class="btnNew"></a></span></td>
			</tr>
		</c:forEach>
		
		<c:if test="${errorMessageDisabledPatients != null }">
		<tr>
			<td><div class="info">${errorMessageDisabledPatients}</div>
			<c:remove var="errorMessageDisabledPatients" scope="session" /></td> 
		</tr>
		</c:if>
</table>
</div><br><br><br>




<!-- Patient Report -->
<h4 style="color:goldenrod; font-size:14px; text-decoration:underline;" >Patient Report for <span>${year }</span></h4><br>
				<span>Year:</span>
		<form action="view_doctor_reports.it">
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
			<input type="submit" value="Go">
			</form><br/><br><br><br>
				
				<div style="padding-left:36px; width:1000px;">
			
	<c:forEach items="${patientReport }" var="form">
		<h1>${form.key }</h1>
			<div class="section">
			
			<p class="titles">Female</p>
			<table class="tablecontent">
				<tr>
					<th class="phn">PATIENT'S NAME</th>
					<th class="phn">AGE</th>
					<th class="phn">PRIMARY DIAGNOSIS</th>
					<th class="phn">SECONDARY DIAGNOSIS</th>
				</tr>
				<c:forEach items="${form.value }" var="p">
					<c:if test="${p.patient.personInfo.sex.equalsIgnoreCase('female')}">
						<tr>
							<td class="phn"><span>${p.patient.personInfo.firstName } ${p.patient.personInfo.lastName }</span></td>
							<td class="phn"><span> ${p.patient.personInfo.age }</span></td>
							<td class="phn">${p.diagnosis.primaryDiagnosis }</td>
							<td class="phn">${p.diagnosis.secondaryDiagnosis }</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			
			<br><br>
			<p class="titles">Male</p>
			<table class="tablecontent">
				<tr>
					<th class="phn">PATIENT'S NAME</th>
					<th class="phn">AGE</th>
					<th class="phn">PRIMARY DIAGNOSIS</th>
					<th class="phn">SECONDARY DIAGNOSIS</th>
				</tr>
				<c:forEach items="${form.value }" var="p">
					<c:if test="${p.patient.personInfo.sex.equalsIgnoreCase('male')}">
						<tr>
							<td class="phn"><span>${p.patient.personInfo.firstName } ${p.patient.personInfo.lastName }</span></td>
							<td class="phn"><span> ${p.patient.personInfo.age }</span></td>
							<td class="phn">${p.diagnosis.primaryDiagnosis }</td>
							<td class="phn">${p.diagnosis.secondaryDiagnosis }</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
						
			
				
			</div><br><br>
	</c:forEach>

<br><br></div>




	<!-- Diagnosis Report -->
<h4 style="color:goldenrod; font-size:14px; text-decoration:underline;" >Diagnosis Report for ${year}</h4><br>
<span>Year:</span>
		<form action="view_doctor_reports.it">
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
			<input type="submit" value="Go">
			</form><br/><br><br><br>

	<c:forEach items="${diagnosisReport }" var="form">	
		<h1>${form.key }</h1>
			<div class="section">
				<table class="tablecontent">
					<tr>
						<th class="phn" colspan="2">OLD PATIENTS COUNT</th>
						<th class="phn" colspan="2">NEW PATIENTS COUNT</th>
					</tr>
					<tr>
						<td class="phn"><b>MALE</b></td>
						<td class="phn"><b>FEMALE</b></td>
						<td class="phn"><b>MALE</b></td>
						<td class="phn"><b>FEMALE</b></td>
					</tr>					
					<tr>
						<td class="phn"><span>${form.value.maleOld }</span></td>
						<td class="phn"><span>${form.value.maleNew }</span></td>
						<td class="phn"><span>${form.value.femaleOld }</span></td>
						<td class="phn"><span>${form.value.femaleNew }</span></td>
					</tr>
				</table>
			</div><br><br>
	</c:forEach>		
</div>
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

</body>
</html>		