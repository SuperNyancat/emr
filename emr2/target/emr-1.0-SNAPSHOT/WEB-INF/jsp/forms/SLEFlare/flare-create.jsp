<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>Create SLE Flare</title>
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
				<div>
				<p class="titles">SLE FLARE</p><br><br>
				</div>
		<form:form action="create_sle_flare_form.it?id=${patient.getId() }" method="post" commandName="form">
			<ul>
			
			
		<form:checkbox value="S-S Complete" path="checkbox"/><span>S-S Complete</span>
		<form:checkbox value="S-S no dsDNA" path="checkbox"/><span>S-S no dsDNA</span>
		<form:checkbox value="MEX-SLEDAI" path="checkbox"/><span>MEX-SLEDAI</span>
		<form:checkbox value="MEX-SLEDAI no labs" path="checkbox"/><span>MEX-SLEDAI no labs</span>				
			<br><br><br><br>

					<table class="tablecontent3">
					<tr>
							<th>Mild or Moderate Flare</th>
							<th>Severe Flare</th>
					</tr>

						<tr>					
							<td class="pro" align="center"><span><form:checkbox path="mildOrMod_row1" value="1"/>Change in SLEDAI > 3 points</span></td>
							<td class="pro" align="center"><span><form:checkbox path="severe_row1" value="1"/>Change in SLEDAI > 12</span></td>						
						</tr>
						<tr>					
							<td class="pro" align="center"><span><form:checkbox path="mildOrMod_row2" value="1"/> New/Worse discoid, photoscnsitive, profundus,
							cutaneous vasculitis, bullous lupus<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspNasopharyngeal ulcers<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspPleuritis<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspPericarditis<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspArthritis<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspFever (SLE)</span></td>
							<td class="pro" align="center"><span><form:checkbox path="severe_row2" value="1"/>New/Worse CNS-SLI:
							<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspVasculius <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspNephritis <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspMyositis <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspPk < 60.000<br> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspHome anemia: Hb <7% or decrease in Hb > 3%<br> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspRequiring: double prednisone<br>
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspPrednisone>0.5 mg/kg/day hospitalization
							</span></td>						
						</tr>
						<tr>					
							<td class="pro" align="center"><span><form:checkbox path="mildOrMod_row3" value="1"/>Increase in Prednisone, but not to >0.5 mg/kg/day</span></td>
							<td class="pro" align="center"><span><form:checkbox path="severe_row3" value="1"/>Prednisone >0.5 mg/kg/day</span></td>						
						</tr>
						
						<tr>					
							<td class="pro" align="center"><span><form:checkbox path="mildOrMod_row4" value="1"/>Added NSAID or Plaquenil<br>
							<form:checkbox path="mildOrMod_row5" value="1"/>≥1.0 Increase in PGA, but not to more than 2.5</span></td>
							<td class="pro" align="center"><span><form:checkbox path="severe_row4" value="1"/>New Cytoxan, Azathioprine, Methotrexate, Hospitalization (SLE)<br>
							<form:checkbox path="severe_row5" value="1"/>Increase in PGA to > 2.5</span></td>						
						</tr>						
					</table>
</ul>
			<br><br><br><br>
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Add Form" class="btnSave"></span>
					<a href="SLE_flare_table.it?id=${patient.getId() }"><span class="btn"><input type="button"
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