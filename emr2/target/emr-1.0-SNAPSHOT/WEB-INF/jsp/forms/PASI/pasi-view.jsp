<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>View PASI Form</title>
	<meta charset="utf-8">
	<style>
		table, td, th {
			border: 1px solid gray;
			border-collapse: collapse;
		}
		td {
			padding: 6px;
			text-align: left;
		}
	</style>
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
	<div class="wrapper prospects">
		<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="forms" />
			</jsp:include>
 
		<div class="tab-content">
			<section class="settingBody clrfix">		
						<div class = "left">
						<jsp:include page="../../headers/patient-left.jsp" />
					</div>
			
			
			
			
		<div class="right">
			<form:form action="pasi_view.it?id=${patient.id }" method="post" commandName="form">
			<div>
				<br><p class="titles" style="color:goldenrod">Psoriasis Area and Severity Index (PASI) Worksheet</p><br>		
			</div>
			<br><br>
			
			<ul>
				<li>
					<b>Patient Name:</b> ${form.getPatientName()} 
					<br><br>
				</li>
				<li>
					<b>Hospital No.:</b>&nbsp&nbsp&nbsp ${form.getHospitalNumber()} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				</li><br><br>
			</ul>
			
			<h4>Psoriasis Area and Severity Index</h4>	
				<div class="">
					<p align="" style="">
						<b>
							The Psoriasis Area and Severity Index (PASI) is a quantitative rating score for measuring the
							severity of psoriatic lesions based on area coverage and plaque appearance.
							<br><br>
						</b>
					</p>
								
					<p align="center" style="">
						<b>
							Lesion Score: &nbsp&nbsp&nbsp
							0 = None &nbsp&nbsp&nbsp
							1 = Slight &nbsp&nbsp&nbsp
							2 = Moderate &nbsp&nbsp&nbsp
							3 = Severe &nbsp&nbsp&nbsp
							4 = Very Severe
							<br><br>
						</b>
					</p>
					
					<table border="1px" class="navigation" style="margin:0px auto;">
						<tr>
							<th style="font-size:12px;width:400px;"><b>Plaque Characteristic</b></th>
							<th style="font-size:12px;width:400px;"><b>Head</b></th>
							<th style="font-size:12px;width:400px;"><b>Upper Limbs</b></th>
							<th style="font-size:12px;width:400px;"><b>Trunk</b></th>
							<th style="font-size:12px;width:400px;"><b>Lower Limbs</b></th>
						</tr>
									
						<tr>
							<td align=""><b>Erythema</b></td> <form:hidden path="pasiDetail.identifier" value="Erythema"/>
							<td align="center">
								1
							</td>
							<td align="center">
								1
							</td>
							<td align="center">
								1
							</td>
							<td align="center">
								2
							</td>
						</tr>
							<tr>
							<td align=""><b>Induration/Thickness</b></td> <form:hidden path="pasiDetail.identifier" value="Induration/Thickness"/>
							<td align="center">
								3
							</td>
							<td align="center">
								3
							</td>
							<td align="center">
								3
							</td>
							<td align="center">
								4
							</td>
						</tr>
							<tr>
							<td align=""><b>Scaling</b></td> <form:hidden path="pasiDetail.identifier" value="Scaling"/>
							<td align="center">
								1
							</td>
							<td align="center">
								2
							</td>
							<td align="center">
								3
							</td>
							<td align="center">
								4
							</td>
						</tr>
							<tr>
							<td colspan="5">Add together each of the 3 scores for each body region to give 4 separate sums (A).</td>
						</tr>	
						
						<tr>
							<td align="center"><b>Lesion Score Sum (A)</b></td> <form:hidden path="pasiDetail.identifier" value="sumA"/>
							<td>${form.getPasiDetail().getHead()}</td>
							<td>${form.getPasiDetail().getUpperLimbs()}</td>
							<td>${form.getPasiDetail().getTrunk()}</td>
							<td>${form.getPasiDetail().getLowerLimbs()}</td>
						</tr>														
					</table>
					<br><br>
			
					<p align="center" style="">
						<b>
							Area Score: &nbsp
							0 = 0% &nbsp
							1 = 1% - 9% &nbsp
							2 = 10% - 29% &nbsp
							3 = 30% - 49% &nbsp
							4 = 50% - 69% &nbsp
							5 = 70% - 89% &nbsp
							6 = 90% - 100% &nbsp
							<br><br>
						</b>
					</p>
					
					<table border="1px" class="navigation" style="margin:0px auto;">
						<tr>
							<td colspan="5"><b>Percentage Area Affected</b></td>	
						</tr>
									
						<tr>
							<td colspan="5"><b>Area Score (B)</b> <i>Degree of involvement as a percentage for each body region affected 
							(score each region with score between 0-6)</i></td>
						</tr>
						
						<tr>
							<td style="font-size:12px;width:400px;"><b></b></td>
							<th style="font-size:12px;width:400px;"><b>Head</b></th>
							<th style="font-size:12px;width:400px;"><b>Upper Limbs</b></th>
							<th style="font-size:12px;width:400px;"><b>Trunk</b></th>
							<th style="font-size:12px;width:400px;"><b>Lower Limbs</b></th>
						</tr>
								
						<tr>
							<td align="center"><b></b></td> <form:hidden path="pasiDetail.identifier" value="area"/>
							<td align="center">
								6
							</td>
							<td align="center">
								5
							</td>
							<td align="center">
								4
							</td>
							<td align="center">
								5
							</td>
						</tr>
							<tr>
							<td colspan="5">Multiply Lesion Score Sum (A) by Area Score (B), for each body region, to give 4 individual subtotals (C)</td>
						</tr>	
					
						<tr>
							<td align="center"><b>Subtotals (C)</b></td> <form:hidden path="pasiDetail.identifier" value="subtotalsC"/>
							<td>${form.getPasiDetail().getHead()}</td>
							<td>${form.getPasiDetail().getUpperLimbs()}</td>
							<td>${form.getPasiDetail().getTrunk()}</td>
							<td>${form.getPasiDetail().getLowerLimbs()}</td>
						</tr>
							<tr>
							<td colspan="5">Multiply each of the Subtotals (C) by amount of body surface area represented by that region, i.e. x 0.1 for head, x 0.2 for upper body, x 0.3 for trunk, and x 0.4 for lower limbs.</td>
						</tr>
							
						<tr>
							<td align="center"><b>Body Surface Area</b></td>
							<td align="center"><b>x 0.1</b></td>
							<td align="center"><b>x 0.2</b></td>
							<td align="center"><b>x 0.3</b></td>
							<td align="center"><b>x 0.4</b></td>
						</tr>
									
						<tr>
							<td align="center"><b>Totals (D)</b></td> <form:hidden path="pasiDetail.identifier" value="totalsD"/>
							<td>${form.getPasiDetail().getHead()}</td>
							<td>${form.getPasiDetail().getUpperLimbs()}</td>
							<td>${form.getPasiDetail().getTrunk()}</td>
							<td>${form.getPasiDetail().getLowerLimbs()}</td>
						</tr>
									
						<tr>
							<td colspan="5">Add together each of the scores for each body region to give the final PASI Score</td>
						</tr>
					</table>
					<br><br>
					
					<ul align="center">
						<li>
							<b>PASI Score:</b> &nbsp&nbsp&nbsp ${form.getScore()} &nbsp&nbsp&nbsp
						</li><br><br>
					</ul>
					
		<section>
			<ul class="btnForm">
				<span class="btn"><input type="submit"
						value="Add Form" class="btnSave"></span></li>
				<a href="pasi_table.it?id=${patient.getId() }"><span class="btn"><input type="button"
						value="Cancel" class="btnCancel"></span></a>
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