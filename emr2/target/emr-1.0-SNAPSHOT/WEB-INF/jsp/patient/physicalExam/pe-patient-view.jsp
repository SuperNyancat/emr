<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	
</head>

<body>

<div id="wrap">

		<jsp:include page="../../headers/doctor-header.jsp">
			<jsp:param name="title" value="View History Update" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>


<div class="pageCtrl">
<ul class="ctrlBtn">
	<li><span class="btn">
		<form:form commandName="form" action="pep_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="pep_edit.it" method="GET">
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
			<form:form commandName="form" action="pep_delete.it" method="GET">
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
		
			<div class="tab-content">
				<div id="History" class="tab active">           
					<section class="settingBody clrfix">		
						<div class = "left">
							<jsp:include page="../../headers/patient-left.jsp" />
						</div>
						
						<div class="right">
							<div>
								<br><p class="titles" style="color:goldenrod">Patient's Assessment</p><br>		
							</div>
							<br><br>
						
							<h4>Patient Assessment</h4>	
								<div class="">
									<p style="color:goldenrod;"><b>Scale:&nbsp 0=Without Any Difficulty 1=With Some Difficulty 2=With Much Difficulty 3=Unable To Do</b></p><br>
									
									<table border="1px" class="navigation" style="margin:0px auto;">
										<tr>
											<th align="center"><b>ACTIVITY LEVEL<br>Right now, are you able to:</b></th>
											<th align="center"><b>Rating</b></th>
										</tr>
										
										<tr>
											<td>1. Dress yourself, including tying shoelaces and doing buttons?</td>
											<td align="center">&nbsp&nbsp&nbsp&nbsp&nbsp ${form.getDressing()}</td>
										</tr>

										<tr>
											<td>2. Get in and out of bed?</td>
											<td align="center">&nbsp&nbsp&nbsp&nbsp&nbsp ${form.getBed()}</td>
										</tr>	

										<tr>
											<td>3. Lift a full cup or glass to your mouth?</td>
											<td align="center">&nbsp&nbsp&nbsp&nbsp&nbsp ${form.getLiftCup()}</td>
										</tr>	

										<tr>
											<td>4. Walk outdoors on flat ground?</td>
											<td align="center">&nbsp&nbsp&nbsp&nbsp&nbsp ${form.getWalkOutdoors()}</td>
										</tr>	

										<tr>
											<td>5. Wash and dry your entire body?</td>
											<td align="center">&nbsp&nbsp&nbsp&nbsp&nbsp ${form.getWashBody()}</td>
										</tr>	

										<tr>
											<td>6. Bend down to pick up clothing from the floor?</td>
											<td align="center">&nbsp&nbsp&nbsp&nbsp&nbsp ${form.getBendDown()}</td>
										</tr>	

										<tr>
											<td>7. Turn regular faucets on and off?</td>
											<td align="center">&nbsp&nbsp&nbsp&nbsp&nbsp ${form.getTurnFaucets()}</td>
										</tr>	

										<tr>
											<td>8. Get in and out of a car, bus, train or airplane?</td>
											<td align="center">&nbsp&nbsp&nbsp&nbsp&nbsp ${form.getInVehicle}</td>
										</tr>	

										<tr>
											<td>9. Walk two miles?</td>
											<td align="center">&nbsp&nbsp&nbsp&nbsp&nbsp ${form.getWalkTwoMiles()}</td>
										</tr>	

										<tr>
											<td>10. Participate in sports and games as you like?</td>
											<td align="center">&nbsp&nbsp&nbsp&nbsp&nbsp ${form.getGames()}</td>
										</tr>

										<tr>
											<td>11. Get a good night’s sleep?</td>
											<td align="center">&nbsp&nbsp&nbsp&nbsp&nbsp ${form.getSleep()}</td>
										</tr>	

										<tr>
											<td>12. Deal with feelings of anxiety or being nervous?</td>
											<td align="center">&nbsp&nbsp&nbsp&nbsp&nbsp ${form.getAnxiety()}</td>
										</tr>	

										<tr>
											<td>13. Deal with feelings of depression or feeling blue?</td>
											<td align="center">&nbsp&nbsp&nbsp&nbsp&nbsp ${form.getDepression()}</td>
										</tr>																	
									</table>
									<br><br>
									<p style="color:goldenrod;"><b>INSTRUCTIONS FOR OFFICE STAFF</b></p>
									<p><i>Activity Level Index Scoring: For FN (questions 1-10) add total points and convert using scale on right. For PS (questions 11-13), add total points.</i></p>
									<p><i>Visual Analog Scales: Measure with metric ruler. Line is exactly 10 cm long. Scores should be recorded in cm.mm format.</i></p>								
								
									<br><br>
								<table>
									<tr>
										<th style="width:30px;">Function (FN) Index</th>
										<th>${form.FN}</th>
									</tr>
									<tr>
										<th>Patient Global (GL) Score </th>
										<th>${form.GL}</th>
									</tr>
									<tr>
										<th>Patient Pain (PN) Score </th>
										<th>${form.PN}</th>
									</tr>
								</table>
									</div>
								<br><br>
							
						</div>								
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

	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="js/expandCollapse.js"></script>
	<script src="js/buttons.js"></script>
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