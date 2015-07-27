<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>
	<meta charset="utf-8">
	<style>
		table, td {
			border: 1px solid gray;
			border-collapse: collapse;
		}
		td {
			padding: 5px;
			text-align: left;
		}
	</style>
</head>

<body>

<div id="wrap">
<c:choose>
	<c:when test="${nurse != null }">
		<jsp:include page="../../headers/nurse-header.jsp">
			<jsp:param name="title" value="New History Update" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../../headers/doctor-header.jsp">
			<jsp:param name="title" value="New History Update" />
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
			<jsp:param name="selected" value="history" />
			</jsp:include>
		
			<div class="tab-content">
				<div id="History" class="tab active">           
					<section class="settingBody clrfix">		
						<div class = "left">
							<jsp:include page="../../headers/patient-left.jsp" />
						</div>	
			
					<div class="right">
						<form:form action="uh_create.it?id=${patient.id }" commandName="form" method="post">
								<div style="background:goldenrod;">
									<br><p class="titles" style="color:white">Patient History Update</p><br>		
								</div>
								<br>
								
								<label class="bigfont"><h4>What has happened since you were last here?</h4></label><br><br>
										
								<label class="bigfont"><h4>Since your last visit, have you?</h4></label><br>
								<table class="tableContenttrans1">	
									<tr>
										<td class="phn"><center><b>Question</b></center></td>
										<td class="phn"><center><b>Yes</b></center></td> 
										<td class="phn"><center><b>No</b></center></td>
										<td class="phn"><center><b>If yes, please specify</b></center></td>
									</tr>
									
									<tr>
										<td class="phn">Had any illnesses?</td>
										<td class="phn">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton value="Yes" path="illness"/></td> 
										<td class="phn">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton required="true" value="No" path="illness"/></td>
										<td class="phn"><form:input path="illness_specify" style="width:180px; height:18px;" /></td>
									</tr>
	
									<tr>
										<td class="ind">Seen any healthcare providers?</td>
										<td class="ind">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton required="true" value="Yes" path="healthCare"/></td> 
										<td class="phn">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton required="true" value="No" path="healthCare"/></td>
										<td class="phn"><form:input path="healthCare_specify" style="width:180px; height:18px;" /></td>
									</tr>

									<tr>
										<td class="pro">Had an x-ray, lab or other procedures?</td>
										<td class="ind">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton required="true" value="Yes" path="xrayLab"/></td> 
										<td class="phn">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton required="true" value="No" path="xrayLab"/></td>
										<td class="phn"><form:input path="xrayLab_specify" style="width:180px; height:18px;" /></td>
									</tr>
									
									<tr>
										<td class="pro">Had any change in your family medical history?</td>
										<td class="ind">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton required="true" value="Yes" path="familyHistoChange"/></td> 
										<td class="phn">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton required="true" value="No" path="familyHistoChange"/></td>
										<td class="phn"><form:input path="familyHistoChange_specify" style="width:180px; height:18px;" /></td>
									</tr>
									
									<tr>
										<td class="pro">Had any change in your social history?</td>
										<td class="ind">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton required="true" value="Yes" path="socialHistoChange"/></td> 
										<td class="phn">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton required="true" value="No" path="socialHistoChange"/></td>
										<td class="phn"><form:input path="socialHistoChange_specify" style="width:180px; height:18px;" /></td>
									</tr>
									
									<tr>
										<td class="pro">Had any new allergies or reactions to medications?</td>
										<td class="ind">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton required="true" value="Yes" path="newAllergies"/></td> 
										<td class="phn">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton required="true" value="No" path="newAllergies"/></td>
										<td class="phn"><form:input path="newAllergies_specify" style="width:180px; height:18px;" /></td>
									</tr>
									
									<tr>
										<td class="pro">Started, changed or stopped any new medications?</td>
										<td class="ind">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton required="true" value="Yes" path="medsChange"/></td> 
										<td class="phn">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <form:radiobutton required="true" value="No" path="medsChange"/></td>
										<td class="phn"><form:input path="medsChange_specify" style="width:180px; height:18px;" /></td>
									</tr>
								</table>	
								<br>
								
								<div class="tableHeadertrans1 clrfix">
								<table border="1" class="navigation">
									<tr>
										<td class="pro">New diseases or illnesses developed by relatives (parents, children, aunts, uncles, brothers, sisters)</a></td>
									</tr>
								</table>
								</div>
								<div>
									<form:textarea path="relativesDiseases" rows="4" cols="50" style="width:694px; height:60px;"/>
									
								</div>
								<br>
								
								<div class="tableHeadertrans1 clrfix">
								<table border="1" class="navigation">
									<tr>
										<td class="pro">Changes in your social situation: Work, relationships, residence, smoking, alcohol consumption</a></td>
									</tr>
								</table>
								</div>
								<div>
									<form:textarea path="socialChanges" rows="4" cols="50" style="width:694px; height:60px;"/>
									
								</div>
								<br>
								
								<div class="tableHeadertrans1 clrfix">
								<table border="1" class="navigation">
									<tr>
										<td class="pro">New allergies or reactions to medications</a></td>
									</tr>
								</table>
								</div>
								<div>
									<form:textarea path="allergiesOrReactions" rows="4" cols="50" style="width:694px; height:60px;"/>
									
								</div>
								<br><br>
								
								<label class="bigfont"><h4>Please list medicine that are new, changed or stopped since your last visit</h4></label><br>
								<table>
									<tr>
										<td class="pro"><b>Name of Medication</b></a></td>
										<td class="ind"><b>New, Change Or Stop (For dose change, indicate current dosage)</b></a></td>
										<td class="pro"><b>Name of Prescribing Doctor (If you made the change, put Self)</b></a></td>
										<td class="ind"><b>Why was the medication changed or stopped? No longer needed? No longer effective or not effective? Side effects? (Please Specify)</b></a></td>
									</tr>
									
									<tr>
										<td class="pro"><form:input path="medsUpdates[0].name" style="width:150px; height:18px;" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
										<td class="ind"><form:input path="medsUpdates[0].status" style="width:150px; height:18px;" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
										<td class="pro"><form:input path="medsUpdates[0].prescriber" style="width:150px; height:18px;" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
										<td class="ind"><form:input path="medsUpdates[0].reason" style="width:150px; height:18px;" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
									</tr>

									<tr>
										<td class="pro"><form:input path="medsUpdates[1].name" style="width:150px; height:18px;" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
										<td class="ind"><form:input path="medsUpdates[1].status" style="width:150px; height:18px;" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
										<td class="pro"><form:input path="medsUpdates[1].prescriber" style="width:150px; height:18px;" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
										<td class="ind"><form:textarea path="medsUpdates[1].reason" style="width:150px; height:18px;" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
									</tr>

									<tr>
										<td class="pro"><form:input path="medsUpdates[2].name" style="width:150px; height:18px;" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
										<td class="ind"><form:input path="medsUpdates[2].status" style="width:150px; height:18px;" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
										<td class="pro"><form:input path="medsUpdates[2].prescriber" style="width:150px; height:18px;" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
										<td class="ind"><form:textarea path="medsUpdates[2].reason" style="width:150px; height:18px;" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
									</tr>
								</table>
								<br>
								
								<label class="bigfont"><h4>How Do You Feel Today as Compared to Your Last Visit Here?</h4></label><br>
								<b>
									<span style="color:goldenrod;"><u>Please rate the following items using this scale:</u></span><br>
								</b>
								<br>
								
								<table class="tableContenttrans1">

									<tr>
										<td class="phn"><center><b>Question</b></center></td>
										<td class="phn"><center><b>Problem Not Present Today</b></center></td> 
										<td class="phn"><center><b>Much Better</b></center></td>
										<td class="phn"><center><b>Better</b></center></td> 
										<td class="phn"><center><b>Same</b></center></td>
										<td class="phn"><center><b>Worse</b></center></td> 
										<td class="phn"><center><b>Much Worse</b></center></td>
										<td class="phn"><center><b>New Problem</b></center></td>
									</tr>
									
									<tr>
										<td class="ind">Pain</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="pain"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="pain"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="pain"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="pain"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="pain"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="pain"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="pain"/>N</td> 
									</tr>
	
									<tr>
										<td class="ind">Swelling</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="swelling"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="swelling"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="swelling"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="swelling"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="swelling"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="swelling"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="swelling"/>N</td> 
									</tr>

									<tr>
										<td class="pro">Fatique</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="fatigue"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="fatigue"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="fatigue"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="fatigue"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="fatigue"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="fatigue"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="fatigue"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Ringing in Ears</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="ringingInEars"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="ringingInEars"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="ringingInEars"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="ringingInEars"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="ringingInEars"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="ringingInEars"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="ringingInEars"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Stomach Upset</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="stomachUpset"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="stomachUpset"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="stomachUpset"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="stomachUpset"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="stomachUpset"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="stomachUpset"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="stomachUpset"/>N</td>  
									</tr>
									
									<tr>
										<td class="pro">Skin Rash</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="skinRash"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="skinRash"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="skinRash"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="skinRash"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="skinRash"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="skinRash"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="skinRash"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Bruising</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="bruising"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="bruising"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="bruising"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="bruising"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="bruising"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="bruising"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="bruising"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Difficulty Sleeping</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="difficultySleeping"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="difficultySleeping"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="difficultySleeping"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="difficultySleeping"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="difficultySleeping"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="difficultySleeping"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="difficultySleeping"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Cough</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="cough"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="cough"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="cough"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="cough"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="cough"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="cough"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="cough"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Eyes Red</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="eyesRed"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="eyesRed"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="eyesRed"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="eyesRed"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="eyesRed"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="eyesRed"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="eyesRed"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Chest Pain</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="chestPain"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="chestPain"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="chestPain"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="chestPain"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="chestPain"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="chestPain"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="chestPain"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Fever</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="fever"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="fever"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="fever"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="fever"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="fever"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="fever"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="fever"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Oral Ulcers</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="oralUlcers"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="oralUlcers"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="oralUlcers"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="oralUlcers"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="oralUlcers"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="oralUlcers"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="oralUlcers"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Diarrhea</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="diarrhea"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="diarrhea"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="diarrhea"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="diarrhea"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="diarrhea"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="diarrhea"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="diarrhea"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Skin Ulcers</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="skinUlcers"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="skinUlcers"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="skinUlcers"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="skinUlcers"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="skinUlcers"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="skinUlcers"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="skinUlcers"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Swollen Glands</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="swollenGlands"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="swollenGlands"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="swollenGlands"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="swollenGlands"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="swollenGlands"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="swollenGlands"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="swollenGlands"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Headache</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="headache"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="headache"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="headache"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="headache"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="headache"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="headache"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="headache"/>N</td>  
									</tr>
									
									<tr>
										<td class="pro">Shortness of Breath</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="shortnessOfBreath"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="shortnessOfBreath"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="shortnessOfBreath"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="shortnessOfBreath"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="shortnessOfBreath"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="shortnessOfBreath"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="shortnessOfBreath"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Eyes Dry</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="eyesDry"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="eyesDry"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="eyesDry"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="eyesDry"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="eyesDry"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="eyesDry"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="eyesDry"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Heart Palpitations</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="heartPalpitations"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="heartPalpitations"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="heartPalpitations"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="heartPalpitations"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="heartPalpitations"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="heartPalpitations"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="heartPalpitations"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Weight Loss</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="weightLoss"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="weightLoss"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="weightLoss"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="weightLoss"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="weightLoss"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="weightLoss"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="weightLoss"/>N</td> 
									</tr>
									
									<tr>
										<td class="pro">Overall Assessment</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="0 - Problem Not Present Today" path="overallAssessment"/>0</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="1 - Much Better" path="overallAssessment"/>1</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="2 - Better" path="overallAssessment"/>2</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="3 - Same" path="overallAssessment"/>3</td>
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="4 - Worse" path="overallAssessment"/>4</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="5 - Much" path="overallAssessment"/>5</td> 
										<td class="phn">&nbsp&nbsp<form:radiobutton required="true" value="N - New Problem" path="overallAssessment"/>N</td> 
									</tr>
								</table>	
								<br><br>
								
								<div class="tableHeadertrans1 clrfix">
								<table border="1" class="navigation">
									<tr>
										<td class="pro">How Long is your morning stiffness (minutes)?</a></td>
									</tr>
								</table>
								</div>
								<div>
									<form:textarea path="morningStiffness" rows="4" cols="50" style="width:694px; height:30px;"/>
									
								</div>
								<br>
								
								<div class="tableHeadertrans1 clrfix">
								<table border="1" class="navigation">
									<tr>
										<td class="pro">What is your worst joint?</a></td>
									</tr>
								</table>
								</div>
								<div>
									<form:textarea path="worstJoint" rows="4" cols="50" style="width:694px; height:30px;"/>
									
								</div>
								<br><br><br><br>
								
								
								
						<section>
							<ul class="btnForm">
								<span class="btn"><input type="submit" value="Save" class="btnSave"></span>
								<a href="uh_table.it?id=${patient.id }"><span class="btn"><input type="button"
										value="Cancel" class="btnCancel" onClick="viewPotentialsList()"></span></a>
								<font style="padding-left:360px"></font>	
								<span class="btn"><input type="button"
									value="Back to Top" class="btnTop"></span>
							</ul>
						</section>
							</form:form>	
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