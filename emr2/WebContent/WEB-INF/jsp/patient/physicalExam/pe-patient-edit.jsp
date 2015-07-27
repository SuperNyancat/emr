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
	<jsp:param name="title" value="New Patient Assessment" />
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
			<jsp:param name="selected" value="physical" />
			</jsp:include>
			
			<div class="tab-content">
				<div id="History" class="tab active">           
					<section class="settingBody clrfix">		
						<div class = "left">
							<jsp:include page="../../headers/patient-left.jsp" />
						</div>
						
						<div class="right">
							<form:form action="pep_update.it?pid=${patient.id }&fid=${form.id }" commandName="form" method="post">
							<form:hidden path="id" value="${form.getId() }"/>
			<form:hidden path="patient.id" value="${patient.getId() }" />
			<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
			<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
			<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
			
							<div>
								<br><p class="titles" style="color:goldenrod">Patient's Assessment</p><br>		
							</div>
							<br><br>
						
							<h4>Patient Assessment</h4>	
								<div class="">
									<p style="color:goldenrod;"><b>Considering all the ways in which illness and health conditions may affect you at this time, please make a mark below to show how you are doing:</b></p>
										<p><br>VERY WELL 
											 <form:radiobutton required="true" path="GL" value="1" />1
											 <form:radiobutton required="true" path="GL" value="2" />2
											 <form:radiobutton required="true" path="GL" value="3" />3 
											 <form:radiobutton required="true" path="GL" value="4" />4
											 <form:radiobutton required="true" path="GL" value="5" />5
											 <form:radiobutton required="true" path="GL" value="6" />6
											 <form:radiobutton required="true" path="GL" value="7" />7
											 <form:radiobutton required="true" path="GL" value="8" />8
											 <form:radiobutton required="true" path="GL" value="9" />9
											 <form:radiobutton required="true" path="GL" value="10" />10
											&nbsp VERY POORLY</p><br><br>
									
									
									<p style="color:goldenrod;"><b>How much pain have you had because of your condition over the past week? Place a mark on the line below to indicate how severe your pain has been:</b></p>
										<p><br>NO PAIN &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp PAIN AS BAD AS IT COULD BE</p><br>
										<p>
											 <form:radiobutton required="true" path="PN" value="1" />1
											 <form:radiobutton required="true" path="PN" value="2" />2
											 <form:radiobutton required="true" path="PN" value="3" />3 
											 <form:radiobutton required="true" path="PN" value="4" />4
											 <form:radiobutton required="true" path="PN" value="5" />5
											 <form:radiobutton required="true" path="PN" value="6" />6
											 <form:radiobutton required="true" path="PN" value="7" />7
											 <form:radiobutton required="true" path="PN" value="8" />8
											 <form:radiobutton required="true" path="PN" value="9" />9
											 <form:radiobutton required="true" path="PN" value="10" />10
											 
											 <br><br><br>
											 <p style="color:goldenrod;"><b>Please answer the following questions, even if you feel that they may not be related to you at this time. <br>Answer exactly as you think or feel – there are no right or wrong answers. Check the one best answer for each question.</b></p><br>
									<br>
									<table border="1px" class="navigation" style="margin:0px auto;">
										<tr>
											<th align="center"><b>ACTIVITY LEVEL<br>Right now, are you able to:</b></th>
											<th align="center"><b>Without Any Difficulty</b></th>
											<th align="center"><b>With Some Difficulty</b></th>
											<th align="center"><b>With Much Difficulty</b></th>
											<th align="center"><b>Unable To Do</b></th>
										</tr>
										
										<tr>
											<td>1. Dress yourself, including tying shoelaces and doing buttons?</td>
											<td align="center"><form:radiobutton required="true" path="dressing" value="0" />0</td>
											<td align="center"><form:radiobutton required="true" path="dressing" value="1" />1</td>
											<td align="center"><form:radiobutton required="true" path="dressing" value="2" />2</td>
											<td align="center"><form:radiobutton required="true" path="dressing" value="3" />3</td>
										</tr>

										<tr>
											<td>2. Get in and out of bed?</td>
											<td align="center"><form:radiobutton required="true" path="bed" value="0"/>0</td>
											<td align="center"><form:radiobutton required="true" path="bed" value="1" />1</td>
											<td align="center"><form:radiobutton required="true" path="bed" value="2" />2</td>
											<td align="center"><form:radiobutton required="true" path="bed" value="3" />3</td>
										</tr>	

										<tr>
											<td>3. Lift a full cup or glass to your mouth?</td>
											<td align="center"><form:radiobutton required="true" path="liftCup" value="0" />0</td>
											<td align="center"><form:radiobutton required="true" path="liftCup" value="1" />1</td>
											<td align="center"><form:radiobutton required="true" path="liftCup" value="2" />2</td>
											<td align="center"><form:radiobutton required="true" path="liftCup" value="3" />3</td>
										</tr>	

										<tr>
											<td>4. Walk outdoors on flat ground?</td>
											<td align="center"><form:radiobutton required="true" path="walkOutdoors" value="0" />0</td>
											<td align="center"><form:radiobutton required="true" path="walkOutdoors" value="1" />1</td>
											<td align="center"><form:radiobutton required="true" path="walkOutdoors" value="2" />2</td>
											<td align="center"><form:radiobutton required="true" path="walkOutdoors" value="3" />3</td>
										</tr>	

										<tr>
											<td>5. Wash and dry your entire body?</td>
											<td align="center"><form:radiobutton required="true" path="washBody" value="0" />0</td>
											<td align="center"><form:radiobutton required="true" path="washBody" value="1" />1</td>
											<td align="center"><form:radiobutton required="true" path="washBody" value="2" />2</td>
											<td align="center"><form:radiobutton required="true" path="washBody" value="3" />3</td>
										</tr>	

										<tr>
											<td>6. Bend down to pick up clothing from the floor?</td>
											<td align="center"><form:radiobutton required="true" path="bendDown" value="0" />0</td>
											<td align="center"><form:radiobutton required="true" path="bendDown" value="1" />1</td>
											<td align="center"><form:radiobutton required="true" path="bendDown" value="2" />2</td>
											<td align="center"><form:radiobutton required="true" path="bendDown" value="3" />3</td>
										</tr>	

										<tr>
											<td>7. Turn regular faucets on and off?</td>
											<td align="center"><form:radiobutton required="true" path="turnFaucets" value="0" />0</td>
											<td align="center"><form:radiobutton required="true" path="turnFaucets" value="1" />1</td>
											<td align="center"><form:radiobutton required="true" path="turnFaucets" value="2" />2</td>
											<td align="center"><form:radiobutton required="true" path="turnFaucets" value="3" />3</td>
										</tr>	

										<tr>
											<td>8. Get in and out of a car, bus, train or airplane?</td>
											<td align="center"><form:radiobutton required="true" path="getInVehicle" value="0" />0</td>
											<td align="center"><form:radiobutton required="true" path="getInVehicle" value="1" />1</td>
											<td align="center"><form:radiobutton required="true" path="getInVehicle" value="2" />2</td>
											<td align="center"><form:radiobutton required="true" path="getInVehicle" value="3" />3</td>
										</tr>	

										<tr>
											<td>9. Walk two miles?</td>
											<td align="center"><form:radiobutton required="true" path="walkTwoMiles" value="0" />0</td>
											<td align="center"><form:radiobutton required="true" path="walkTwoMiles" value="1" />1</td>
											<td align="center"><form:radiobutton required="true" path="walkTwoMiles" value="2" />2</td>
											<td align="center"><form:radiobutton required="true" path="walkTwoMiles" value="3" />3</td>
										</tr>	

										<tr>
											<td>10. Participate in sports and games as you like?</td>
											<td align="center"><form:radiobutton required="true" path="games" value="0" />0</td>
											<td align="center"><form:radiobutton required="true" path="games" value="1" />1</td>
											<td align="center"><form:radiobutton required="true" path="games" value="2" />2</td>
											<td align="center"><form:radiobutton required="true" path="games" value="3" />3</td>
										</tr>

										<tr>
											<td>11. Get a good night’s sleep?</td>
											<td align="center"><form:radiobutton required="true" path="sleep" value="0" />0</td>
											<td align="center"><form:radiobutton required="true" path="sleep" value="1.1" />1.1</td>
											<td align="center"><form:radiobutton required="true" path="sleep" value="2.2" />2.2</td>
											<td align="center"><form:radiobutton required="true" path="sleep" value="3.3" />3.3</td>
										</tr>	

										<tr>
											<td>12. Deal with feelings of anxiety or being nervous?</td>
											<td align="center"><form:radiobutton required="true" path="anxiety" value="0" />0</td>
											<td align="center"><form:radiobutton required="true" path="anxiety" value="1.1" />1.1</td>
											<td align="center"><form:radiobutton required="true" path="anxiety" value="2.2" />2.2</td>
											<td align="center"><form:radiobutton required="true" path="anxiety" value="3.3" />3.3</td>
										</tr>	

										<tr>
											<td>13. Deal with feelings of depression or feeling blue?</td>
											<td align="center"><form:radiobutton required="true" path="depression" value="0" />0</td>
											<td align="center"><form:radiobutton required="true" path="depression" value="1.1" />1.1</td>
											<td align="center"><form:radiobutton required="true" path="depression" value="2.2" />2.2</td>
											<td align="center"><form:radiobutton required="true" path="depression" value="3.3" />3.3</td>
										</tr>																	
									</table>
									<br><br>
									</div>
								<br><br>
							
							<section>
							<ul class="btnForm">
								<span class="btn"><input type="submit" value="Save" class="btnSave"></span>
								<a href="view_pep.it?id=${patient.id }"><span class="btn"><input type="button"
										value="Cancel" class="btnCancel" onClick="viewPotentialsList()"></span></a>
								<font style="padding-left:360px"></font>	
								<span class="btn"><input type="button"
									value="Back to Top" class="btnTop"></span>
							</ul>
						</section>
							
							</form:form>
						</div>								
						</div>
					</section>
					
					
					
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