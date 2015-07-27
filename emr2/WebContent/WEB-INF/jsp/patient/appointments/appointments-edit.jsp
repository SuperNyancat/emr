<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Edit Appointment</title>
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
				<jsp:param name="selected" value="medications" />
			</jsp:include>
		 
			<div class="tab-content">
			   <div id="Profile" class="tab active">
					<section class="settingBody clrfix">			
						<div class = "left">
							<jsp:include page="../../headers/patient-left.jsp" />
						</div>
						
						<div class="right">		
								
								<p class="titles">Edit Appointment</p><br><br>
								
			<form:form action="update_appointment.it?pid=${patient.getId() }&fid=${form.getId() }" method="post" commandName="form">
				<form:hidden path="id" value="${form.id }"/>
				<form:hidden path="patient" value="${form.patient }"/>
				<form:hidden path="doctor" value="${form.doctor }"/>
						<ul>
							<li><label>Doctor</label>: 
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
								</c:choose>
							</li>
							<h4>Title</h4><br>
							<form:textarea path="title" value="${form.getTitle()}" required="true" style="width:450px;height:20px;"/><br><br>
							
							<h4>Details</h4><br>
							<form:textarea path="details" value="${form.getDetails()}" required="true" style="width:450px;height:40px;"/><br><br>
							
							<h4>Date and Time</h4><br>
							<li><label>Date:</label>			 
								 <form:select path="month" required="true">
									<option hidden="${form.month }">${form.month }</option>
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
									<option hidden="${form.day }">${form.day }</option>
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
								
								<form:select path="year" value="${form.getYear()}" required="true" >
									<option hidden="${form.year }">${form.year }</option>
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
								</form:select>										
						</li>

							<br/><br/>
							<li><label>Time Started:</label> 
								<form:input type="number" min="1" value="${form.start_hour }" pattern="(^\+?[\d]+(\-?[\d]+)*)*" required="true" path="start_hour" max="12" placeholder="Hour"/>:
								<form:input type="number" min="0" value="${form.start_minute }" pattern="(^\+?[\d]+(\-?[\d]+)*)*" required="true" path="start_minute" max="60"  placeholder="Minute"/>
																		
								<form:select path="start_ampm" required="true" value="${ form.start_ampm}" >
									<option value="AM">AM</option>
									<option value="PM">PM</option>
								</form:select>										
							</li>
							<br/><br/>
							<li><label>Time Ended:</label> 
								<form:input type="number"  value="${form.end_hour }" pattern="(^\+?[\d]+(\-?[\d]+)*)*" required="true" path="end_hour" min="1" max="12" placeholder="Hour"/>:
								<form:input type="number" value="${form.end_minute }" pattern="(^\+?[\d]+(\-?[\d]+)*)*" required="true" path="end_minute" min="0" max="60" placeholder="Minute"/>
								
								<form:select path="end_ampm" required="true" value="${form.end_ampm }">
									<option value="AM">AM</option>
									<option value="PM">PM</option>
								</form:select>
							
							</li>
						</ul>
										<br/><br/><br/><br/>
								
										
			<section>
								<span class="btn"><input type="submit"
										value="Save" class="btnSave"></span>
								<a href="view_appointment.it?pid=${patient.getId() }&fid=${form.id}"><span class="btn"><input type="button"
										value="Cancel" class="btnCancel" onClick="viewPotentialsList()"></span></a>
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