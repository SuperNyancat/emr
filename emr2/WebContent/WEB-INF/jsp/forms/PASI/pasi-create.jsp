<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Create PASI Form</title>
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
	<form:form action="pasi_create.it?id=${patient.id }" method="post" commandName="form">
			<div>
				<br><p class="titles" style="color:goldenrod">Psoriasis Area and Severity Index (PASI) Worksheet</p><br>		
			</div>
			<br><br>
			
			<ul>
				
				<li>
					<b>Hospital No.:</b>&nbsp&nbsp&nbsp <form:input path="hospitalNumber" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				</li><br><br>
			</ul>
			
			<h4>Psoriasis Area and Severity Index</h4>	
				<div class="">
					<p style="">
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
							<td><b>Erythema</b></td> <form:hidden path="pasiDetails[0].identifier" value="Erythema"/>
							<td align="center">
								<form:radiobutton path="pasiDetails[0].head" value="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[0].head" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[0].head" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[0].head" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[0].head" value="4" required="true" /><b>4</b> <br>
							</td>
							<td align="center">
								<form:radiobutton path="pasiDetails[0].upperLimbs" value="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[0].upperLimbs" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[0].upperLimbs" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[0].upperLimbs" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[0].upperLimbs" value="4" required="true" /><b>4</b> <br>
							</td>
							<td align="center">
								<form:radiobutton path="pasiDetails[0].trunk" value="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[0].trunk" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[0].trunk" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[0].trunk" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[0].trunk" value="4" required="true" /><b>4</b> <br>
							</td>
							<td align="center">
								<form:radiobutton path="pasiDetails[0].lowerLimbs" value="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[0].lowerLimbs" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[0].lowerLimbs" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[0].lowerLimbs" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[0].lowerLimbs" value="4" required="true" /><b>4</b> <br>
							</td>
						</tr>
							<tr>
							<td><b>Induration/Thickness</b></td> <form:hidden path="pasiDetails[1].identifier" value="Induration/Thickness"/>
							<td align="center">
								<form:radiobutton path="pasiDetails[1].head" value="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[1].head" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[1].head" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[1].head" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[1].head" value="4" required="true" /><b>4</b> <br>
							</td>
							<td align="center">
								<form:radiobutton path="pasiDetails[1].upperLimbs" value="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[1].upperLimbs" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[1].upperLimbs" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[1].upperLimbs" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[1].upperLimbs" value="4" required="true" /><b>4</b> <br>
							</td>
							<td align="center">
								<form:radiobutton path="pasiDetails[1].trunk" value="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[1].trunk" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[1].trunk" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[1].trunk" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[1].trunk" value="4" required="true" /><b>4</b> <br>
							</td>
							<td align="center">
								<form:radiobutton path="pasiDetails[1].lowerLimbs" value="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[1].lowerLimbs" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[1].lowerLimbs" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[1].lowerLimbs" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[1].lowerLimbs" value="4" required="true" /><b>4</b> <br>
							</td>
						</tr>
							<tr>
							<td><b>Scaling</b></td> <form:hidden path="pasiDetails[2].identifier" value="Scaling"/>
							<td align="center">
								<form:radiobutton path="pasiDetails[2].head" value="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[2].head" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[2].head" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[2].head" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[2].head" value="4" required="true" /><b>4</b> <br>
							</td>
							<td align="center">
								<form:radiobutton path="pasiDetails[2].upperLimbs" value="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[2].upperLimbs" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[2].upperLimbs" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[2].upperLimbs" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[2].upperLimbs" value="4" required="true" /><b>4</b> <br>
							</td>
							<td align="center">
								<form:radiobutton path="pasiDetails[2].trunk" value="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[2].trunk" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[2].trunk" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[2].trunk" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[2].trunk" value="4" required="true" /><b>4</b> <br>
							</td>
							<td align="center">
								<form:radiobutton path="pasiDetails[2].lowerLimbs" value="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[2].lowerLimbs" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[2].lowerLimbs" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[2].lowerLimbs" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[2].lowerLimbs" value="4" required="true" /><b>4</b> <br>
							</td>
																			
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
							<td style="font-size:12px;width:400px;"><b></b></td>
							<th style="font-size:12px;width:400px;"><b>Head</b></th>
							<th style="font-size:12px;width:400px;"><b>Upper Limbs</b></th>
							<th style="font-size:12px;width:400px;"><b>Trunk</b></th>
							<th style="font-size:12px;width:400px;"><b>Lower Limbs</b></th>
						</tr>
								
						<tr>
							<td align="center"><b></b></td> <form:hidden path="pasiDetails[3].identifier" value="area"/>
							<td align="center">
								<form:radiobutton path="pasiDetails[3].head" value="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[3].head" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[3].head" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[3].head" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[3].head" value="4" required="true" /><b>4</b> <br>
								<form:radiobutton path="pasiDetails[3].head" value="5" required="true" /><b>5</b> <br>
								<form:radiobutton path="pasiDetails[3].head" value="6" required="true" /><b>6</b> <br>
							</td>
							<td align="center">
								<form:radiobutton path="pasiDetails[3].upperLimbs" value="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[3].upperLimbs" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[3].upperLimbs" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[3].upperLimbs" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[3].upperLimbs" value="4" required="true" /><b>4</b> <br>
								<form:radiobutton path="pasiDetails[3].upperLimbs" value="5" required="true" /><b>5</b> <br>
								<form:radiobutton path="pasiDetails[3].upperLimbs" value="6" required="true" /><b>6</b> <br>
							</td>
							<td align="center">
								<form:radiobutton path="pasiDetails[3].trunk" valuue="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[3].trunk" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[3].trunk" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[3].trunk" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[3].trunk" value="4" required="true" /><b>4</b> <br>
								<form:radiobutton path="pasiDetails[3].trunk" value="5" required="true" /><b>5</b> <br>
								<form:radiobutton path="pasiDetails[3].trunk" value="6" required="true" /><b>6</b> <br>
							</td>
							<td align="center">
								<form:radiobutton path="pasiDetails[3].lowerLimbs" valuue="0" required="true" /><b>0</b> <br>
								<form:radiobutton path="pasiDetails[3].lowerLimbs" value="1" required="true" /><b>1</b> <br>
								<form:radiobutton path="pasiDetails[3].lowerLimbs" value="2" required="true" /><b>2</b> <br>
								<form:radiobutton path="pasiDetails[3].lowerLimbs" value="3" required="true" /><b>3</b> <br>
								<form:radiobutton path="pasiDetails[3].lowerLimbs" value="4" required="true" /><b>4</b> <br>
								<form:radiobutton path="pasiDetails[3].lowerLimbs" value="5" required="true" /><b>5</b> <br>
								<form:radiobutton path="pasiDetails[3].lowerLimbs" value="6" required="true" /><b>6</b> <br>
							</td>
					
					</table>
					<br><br><br><br>
					
				
					
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