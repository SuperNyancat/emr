<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Create Check-up Record</title>
	<meta charset="utf-8">
	
	<link rel="stylesheet" href="resources/css/reset.css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="resources/css/template.css">
	<link rel="stylesheet" href="resources/css/forms.css">
	<link rel="stylesheet" href="resources/css/form-popup.css">
	<link rel="stylesheet" href="resources/css/template-table.css">
	<link rel="stylesheet" href="resources/css/homepage.css">	
	<link rel="stylesheet" href="resources/css/tabs.css">	
	<link rel="stylesheet" href="resources/css/settings.css">	
	<!--[if lt IE 9]>
	<script src="resources/js/html5shiv.js"></script>
	<![endif]-->
</head>

<body>
<div id="wrap">
	<jsp:include page="../header.jsp">
	<jsp:param name="title" value="Create Patient" />
	<jsp:param name="selected" value="patients" />
</jsp:include>
	

<div class="pageCtrl">
<ul class="ctrlBtn">
	<li><span class="btn"><a href="patientCheckupSesh.html"><input type="button" value="Check-up Session" class="btnReturn"></a></span></li>
</ul>
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper prospects">
		<section class="settingBody clrfix">		
			<div class = "left">
	
			</div>
			
			<div class="right">
				<h4>New Check-up Record</h4>	
			<form:form method="post" commandName="checkUpForm" action="create_checkup_session.it?id=${patient.getId()}" >			
			<label>Date:</label>
			 
			 <select name="mydropdown">
				<option hidden="Month">Month</option>
				<option value="January">January</option>
				<option value="February">February</option>
				<option value="March">March</option>
				<option value="April">April</option>
				<option value="May">May</option>
				<option value="June">June</option>
				<option value="July">July</option>
				<option value="August">August</option>
				<option value="September">September</option>
				<option value="October">October</option>
				<option value="November">November</option>
				<option value="December">December</option>
			</select>
			
			<select name="mydropdown">
				<option hidden="Day">Day</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				<option value="25">25</option>
				<option value="26">26</option>
				<option value="27">27</option>
				<option value="28">28</option>
				<option value="29">29</option>
				<option value="30">30</option>
				<option value="31">31</option>
			</select>
			
			<select name="mydropdown">
				<option hidden="Year">Year</option>
				<option value="2014">2014</option>
				<option value="2013">2013</option>
				<option value="2012">2012</option>
				<option value="2000">2011</option>
				<option value="2001">2010</option>
				<option value="2002">2009</option>
				<option value="2003">2008</option>
				<option value="2004">2007</option>
				<option value="2005">2006</option>
				<option value="2006">2005</option>
				<option value="2007">2004</option>
				<option value="2008">2003</option>
				<option value="2009">2002</option>
				<option value="2010">2001</option>
				<option value="2011">2000</option>
			</select>
			
			<label>Height:</label>
			 
				<form:select path="feet">
					<option value="0"> - </option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
				</form:select>
				
				<form:select path="inches"><!-- name="mydropdown">-->
					<option value="0"> - </option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
				</form:select><br>
						
		
				<!--BMI: <input type="text" name="bmi"><br>
				BSI: <input type="text" name="bsi"><br>-->
				Weight: <form:input path="weight" />
				<form:select path="weightUnit">
					<option value="lbs">lbs</option>
					<option value="kg">kg</option>
				</form:select>
				<br>
				Doctor: 
				
				<form:select path="doctorId">
				<c:forEach items="${doctors}" var="doc"> 
					<option value="${doc.getId() }">Dr. ${doc.getPersonInfo().getFirstName() } ${doc.getPersonInfo().getLastName() } ${doc.getSuffix() }</option>
				</c:forEach>
				</form:select>
				
				<br>
				Created by:  ${loggedInUser.getPersonInfo().getFirstName() } ${loggedInUser.getPersonInfo().getLastName() }<br><br>
				Symptoms: <br /> <form:textarea path="symptoms"/><br>
				Ailments: <br /><form:textarea path="ailments"/> <br>
				Current Medications: <br /><form:textarea path="previousMedications"/> <br>
				Others: <br /><form:textarea path="others"/>
			
			
			<ul class="ctrlBtn listSpace">
				<li><span class="btn"><input type="submit" value="Create" class="btnEdit" style="right-align"></span></li>
			</ul>
			</form:form>
			</div>
		</section>

	</div>		
</div>
	
</div>
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>
</div>

	<script src="resources/js/jquery-1.9.1.min.js"></script>
	<script src="resources/js/scripts.js"></script>
</body>
</html>