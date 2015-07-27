<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
</head>

<body>

<div id="wrap">
<jsp:include page="../headers/admin-header.jsp">
	<jsp:param name="title" value="Admin Reports" />
	<jsp:param name="selected" value="reports" />
</jsp:include>


<div class="pageCtrl">
	
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper">
	
		<section class="settingBody clrfix">		

			
						<div style="width:1000px;padding-left:36px;">

<p class="titles"><br><br>Admin Reports</p> <br><br><br>

<c:if test="${successMessage != null }">
	<div class="success">${successMessage}</div>
	<c:remove var="successMessage" scope="session" /> 
</c:if>
										
<h4 style="color:goldenrod; font-size:14px; text-decoration:underline;" >Doctors Status</h4> 	<br/>
	<div style="overflow: scroll; height:300px;">	
	<table class="tablecontent">

		<tr>
			<th class="phn">Doctors</th>
			<th class="phn">Status</th>
			<th class="phn">Date Created/Disabled</th>
			<th class="phn">Action</th>
		</tr>
		<c:forEach items="${enabledDoctors}" var="doctor">
			<tr>
				<td class="phn"><span><a href="view_doctor_profile.it?id=${doctor.getId()}"><strong>${doctor.getPersonInfo().getFirstName()} ${doctor.getPersonInfo().getLastName()} ${doctor.getSuffix() }</strong></a></span></td>
				<td class="phn"><span><strong>Enabled</strong></span></td>
				<td class="phn"><span>${doctor.getPersonInfo().getRevisionHistory().getDateCreated()}</span></td>
				<td class="phn"><span class="btn"><a href="disable_doctor.it?id=${doctor.getId() }"><input type="button" value="Disable" class="btnNew" onclick="myFunction1()"></a></span></td>
			</tr>
		</c:forEach>
		
		<c:if test="${disabledDoctors != null || disabledDoctors.size() > 0}">
			<c:forEach items="${disabledDoctors}" var="doctor">
			<tr>
				<td class="phn"><span>${doctor.getPersonInfo().getFirstName()} ${doctor.getPersonInfo().getLastName()} ${doctor.getSuffix() }</span></td>
				<td class="phn"><span>Disabled</span></td>
				<td class="phn"><span>${doctor.getPersonInfo().getRevisionHistory().getDateDeleted()}</span></td>
				<td class="phn"><span class="btn"><a href="enable_doctor.it?id=${doctor.getId() }"><input type="button" value="Enable" class="btnNew" ></a></span></td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
</div><br><br><br>

<h4 style="color:goldenrod; font-size:14px; text-decoration:underline;" >Nurses Status</h4> <br/>
		
<div style="overflow: scroll; height:300px;">	
<table class="tablecontent">

		<tr>
			<th class="phn">Nurses</th>
			<th class="phn">Status</th>
			<th class="phn">Date Created/Disabled</th>
			<th class="phn">Action</th>
		</tr>
		
		
		<c:forEach items="${enabledNurses}" var="nurse">
			<tr>
				<td class="phn"><span><a href="view_nurse_profile.it?id=${nurse.getId()}"><strong>${nurse.getPersonInfo().getFirstName()} ${nurse.getPersonInfo().getLastName()}</strong></a> </span></td>
				<td class="phn"><span><strong>Enabled</strong></span></td>
				<td class="phn"><span>${nurse.getPersonInfo().getRevisionHistory().getDateCreated()}</span></td>
				<td class="phn"><span class="btn"><a href="disable_nurse.it?id=${nurse.getId() }"><input type="button" value="Disable" class="btnNew" onclick="myFunction1()"></a></span></td>
			</tr>
		</c:forEach>
		
		<c:if test="${disabledNurses!= null || disablesNurses.size() > 0}">
			<c:forEach items="${disabledNurses}" var="nurse">
			<tr>
				<td class="phn"><span><strong>${nurse.getPersonInfo().getFirstName()} ${nurse.getPersonInfo().getLastName()} </strong></span></td>
				<td class="phn"><span>Disabled</span></td>
				<td class="phn"><span>${nurse.getPersonInfo().getRevisionHistory().getDateDeleted()}</span></td>
				<td class="phn"><span class="btn"><a href="enable_nurse.it?id=${nurse.getId() }"><input type="button" value="Enable" class="btnNew" ></a></span></td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
</div><br><br><br>





<h4 style="color:goldenrod; font-size:14px; text-decoration:underline;" >Patient Count since ${ year }</h4> 
		<span>Year:</span>
		<form action="view_admin_reports.it">
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
					<option value="2013">2013</option>
					<option value="2012">2012</option>
					<option value="2011">2011</option>
					<option value="2010">2010</option>
					<option value="2009">2009</option>
					<option value="2008">2008</option>
					<option value="2007">2007</option>
					<option value="2006">2006</option>
					<option value="2005">2005</option>
					<option value="2004">2004</option>
					<option value="2003">2003</option>
					<option value="2002">2002</option>
					<option value="2001">2001</option>
					<option value="2000">2000</option>
				</select>	
			</select> <input type="submit" value="Go"></li><br><br>
			</form><br/>
<div style="overflow: scroll; height:300px;">	
<table class="tablecontent">

		<tr>
			<th class="phn">Doctor</th>
			<th class="phn">Count</th>
			
		</tr>
		
		
			<c:forEach items="${patientCount }" var="p" varStatus="i">
			<tr>	
				<td class="phn"><span>${p.key.getPersonInfo().getFirstName()} ${p.key.getPersonInfo().getLastName()} ${p.key.getSuffix() } </span></td>
				<c:choose>
					<c:when test="${p.value == 0 }">
						<td class="phn"><span> - </span></td>
					</c:when>
					<c:otherwise>
						<td class="phn"><span>${p.value }</span></td>
					</c:otherwise>
				</c:choose>
				
			</tr>
			</c:forEach>
		
		<c:if test="${patientCount == null }">
		<tr>
			<div class="info"><span><font color="red" size="3px">There are currently no patients in the system.</font></span></div>
			<c:remove var="patientErrorMessage" scope="session" />
		<tr>
		</c:if>
		
	</table>

		</div><br>
		</div>
		</div>
	</div>
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>
</body>
</html>