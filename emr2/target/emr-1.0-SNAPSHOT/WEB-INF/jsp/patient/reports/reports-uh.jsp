<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
	<title>History Updates Report</title>
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

<p class="titles">History Updates Summary for ${monthWord}, ${year }</p> <br><br>

				<h4>Search</h4>
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
	
	<h4>${monthWord } Updates Since Last Visit</h4>
	<p><i>* click on the <strong>date</strong> for more details *</i></p><br>
		<div style="overflow-x: scroll;">
		<table class="tablecontent">

			<tr>
				<th class="navblank" style="width:40px;">Question</th>
				<c:forEach items="${forms }" var="f">
					<th class="phn" style="width:50px;"><a href="uh_view.it?pid=${patient.id}&fid=${f.id}">${f.getRevisionHistory().getDateCreated() }</a></th>
				</c:forEach>	
			</tr>
			
		<tr>
			<th class="phn">Pain</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.pain}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Swelling</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.swelling}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Fatigue</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.fatigue}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Ringing in Ears</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.ringingInEars}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Stomach Upset</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.stomachUpset}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Skin Rash</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.skinRash}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Bruising</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.bruising}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Difficulty Sleeping</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.difficultySleeping}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Cough</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.cough}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Eyes Red</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.eyesRed}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Chest Pain</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.chestPain}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Fever</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.fever}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Oral Ulcers</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.oralUlcers}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Diarrhea</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.diarrhea}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Skin Ulcers</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.skinUlcers}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Swollen Glands</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.swollenGlands}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Headache</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.headache}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Shortness of Breath</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.shortnessOfBreath}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Eyes Dry</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.eyesDry}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Heart Palpitations</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.heartPalpitations}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Weight Loss</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.weightLoss}</td>
			</c:forEach>	
		</tr>
		<tr>
			<th class="phn">Overall Assessment</th>
			<c:forEach items="${forms }" var="form">
				<td class="phn">${form.overallAssessment}</td>
			</c:forEach>	
		</tr>
	
		</table>		
</div>
<br/><br/><br/><br/>
	
	
	
</c:otherwise>
	</c:choose>

</div>
<br><br>
				
		</div>
		</div></form>
	</div>
	</div>
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>

</body>
</html>