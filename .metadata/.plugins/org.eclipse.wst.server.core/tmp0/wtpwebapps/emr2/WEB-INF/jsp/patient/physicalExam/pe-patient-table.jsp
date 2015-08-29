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

<jsp:include page="../../headers/doctor-header.jsp">
	<jsp:param name="title" value="Physical Examination" />
	<jsp:param name="selected" value="patients" />
</jsp:include>



<div class="pageCtrl">
	<ul class="ctrlBtn">
		<li><span class="btn"><a href="pep_assemble.it?id=${patient.id }"><input type="button" value="New Record" class="btnNew"></a></span></li>
	</ul>
	
</div>

<div class="pageCtrl"></div>

<div class="content-wrap">	
	<div class="wrapper prospects">
		<div class="tabs">
		<c:if test="${patient != null }">
			<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="forms" />
			</jsp:include>
		</c:if>
		<div class="tab-content">
		<div style="background:goldenrod">
				<br><p class="titles" style="color:white;">Patient's Assessment</p><br>		
		</div>
			<div class="tableSearch clrfix">
				<section>
					    <form:form commandName="patient" action="pep_search.it" method="GET">
					   	<form:hidden path="id" value="${patient.id }" />
					  
							<ul class="pro">
								<li><label>Month:</label>			 
									 <select name="month">
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
									</select>
								</li>
							</ul>

							<ul class="pro">
								<li><label>Day:</label>
									<select name="day">
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


							</li>
							</ul>

							<ul class="pro">
								<li><label>Year:</label>
									<select name="year">
										<option hidden="Year">Year</option>
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
									</select></li>
								</ul>
							
							<span class="submit">
								<input type="submit" value="Go">
							</span>						
						</form:form>
				</section>
				
			</div>

					<table class="tablecontent3">	

							<tr>
								<th class="navblank">&nbsp;</th>
								<th class="pro">Date</th>
								<th class="phn">FN Score</th>
								<th class="phn">PN Score</th>
								<th class="phn">GL Score</th>								
							</tr>

		<c:if test="${errorMessage != null }">
		<tr>
			<td><div class="info">${errorMessage}</div>
			<c:remove var="errorMessage" scope="session" /></td> 
			
		</tr>	
		</c:if>
									
				<c:forEach items="${pepForms }" var="form">	
				<tr>
					<td><div class="blue"></div></td>
					<td class="pro"><a href="pep_view.it?pid=${form.patient.id}&fid=${form.id}">${ form.revisionHistory.dateCreated}</a></td>
					<td class="phn">${form.FN}</td>
					<td class="phn">${form.PN}</td>
					<td class="phn">${form.GL}</td>
				</tr>	
				</c:forEach>							
			</table>
	
		<div class="lowernav1">
			<section class="paging">
				<ul>
					<li>
						<select class="perpage">
							<option>5 per page</option>
							<option>10 per page</option>
							<option>15 per page</option>
						</select>
					</li>
					<li>
						<p class="counter">Total Count <a href="">&lt;</a><span>1 to 10</span><a href="">&gt;</a></p></li>
				</ul>
			</section>
		</div></div>
</div>		
    </div>
	
</div>
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>
</div>

</body>
</html>