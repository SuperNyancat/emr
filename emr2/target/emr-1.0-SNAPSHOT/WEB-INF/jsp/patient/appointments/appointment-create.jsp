<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Create Appointment</title>
	<meta charset="utf-8">
	
</head>

<body>

<div id="wrap">
<c:choose>
	<c:when test="${nurse != null }">
		<jsp:include page="../../headers/nurse-header.jsp">
			<jsp:param name="title" value="Doctor Home" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../../headers/doctor-header.jsp">
			<jsp:param name="title" value="Doctor Home" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:otherwise>
</c:choose>

<div class="pageCtrl">

</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	<div class="wrapper">
		<div class="tabs">		
			<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="appointments" />
			</jsp:include>
		 
			<div class="tab-content">
			   <div id="Profile" class="tab active">
					<section class="settingBody clrfix">			
						<div class = "left">
							<jsp:include page="../../headers/patient-left.jsp" />
						</div>
						
						<div class="right">		
								
								<p class="titles">Create Appointment</p><br><br>
								
			<form:form action="create_appointment.it?id=${patient.getId() }" method="post" commandName="form">
			
						<ul>
							<li><h4>Doctor: 
								<c:choose>
								<c:when test="${nurse != null }">
									<select name="doctor" required="required">
										<c:forEach items="${doctors}" var="doc"> 
											<option value="${doc.getId()}">Dr. ${doc.getPersonInfo().getFirstName() } ${doc.getPersonInfo().getLastName() } ${doc.getSuffix() }</option>
										</c:forEach>
									</select>
								</c:when>
								<c:otherwise>
									<span>Dr. ${doctor.getPersonInfo().getFirstName()} ${doctor.getPersonInfo().getLastName()} ${doctor.getSuffix() }</span>
									<form:hidden path="doctor" value="${doctor.getId() }"/>
								</c:otherwise>
								</c:choose></h4>
							</li>
							<br/><br/><br/>
							<h4>Title</h4><br>
							<form:textarea path="title" required="true" style="width:450px;height:20px;"/><br><br>
							
							<br/><br/><h4>Details</h4><br>
							<form:textarea path="details"  required="true" style="width:450px;height:40px;"/><br><br>
							<br/><br/>
							<h4>Date and Time</h4><br>
							<li><label>Date:</label>			 
								 <form:select path="month" required="true">
									<option hidden="Month">Month</option>
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
								</form:select>
								
								<form:select path="day" required="true">
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
								</form:select>
								
								<form:select path="year" required="true" >
									<option hidden="Year">Year</option>
										<option value="2020">2020</option>
										<option value="2019">2019</option>
										<option value="2018">2018</option>
										<option value="2017">2017</option>
										<option value="2016">2016</option>
										<option value="2015">2015</option>
										<option value="2014">2014</option>
								</form:select>										
						</li>
						<br/><br/>
							<li><label>Time Started:</label> 
								<form:input type="number" min="1" pattern="(^\+?[\d]+(\-?[\d]+)*)*" required="true" path="start_hour" max="12" placeholder="Hour"/>:
								<form:input type="number" min="0" pattern="(^\+?[\d]+(\-?[\d]+)*)*" required="true" path="start_minute" max="60"  placeholder="Minute"/>
																		
								<form:select path="start_ampm" required="true" >
									<option value="AM">AM</option>
									<option value="PM">PM</option>
								</form:select>										
							</li>
							<br/><br/>
							<li><label>Time Ended:</label> 
								<form:input type="number" pattern="(^\+?[\d]+(\-?[\d]+)*)*" required="true" path="end_hour" min="1" max="12" placeholder="Hour"/>:
								<form:input type="number" pattern="(^\+?[\d]+(\-?[\d]+)*)*" required="true" path="end_minute" min="0" max="60" placeholder="Minute"/>
								
								<form:select path="end_ampm" required="true">
									<option value="AM">AM</option>
									<option value="PM">PM</option>
								</form:select>
							
							</li>
						</ul>
										<br/><br/><br/><br/>
			<section>
									<ul class="btnForm">
										<span class="btn"><input type="submit"
												value="Save" class="btnSave"></span>
										<a href="appointments_table.it?id=${patient.id }"><span class="btn"><input type="button"
												value="Cancel" class="btnCancel"></span></a>
										<font style="padding-left:360px"></font>	
										<span class="btn"><input type="button"
											value="Back to Top" class="btnTop"></span>
									</ul>
			</section>
			
			</form:form>
						</div>
					</section>  	
					
					<div class="lowernav1">

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