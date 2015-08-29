<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Create DAS28 Form</title>
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
				<form:form action="das_create.it?id=${patient.id }" method="post" commandName="form">
					<form:hidden path="id" value="${form.getId() }"/>
					<form:hidden path="patient.id" value="${patient.getId()}"/>
					<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
					<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
					<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
					<div>
						<br><p class="titles" style="color:goldenrod">Disease Activity Score in 28 Joints (DAS28)</p><br>		
					</div>
					<br><br>
					
					<p align=""><b>Patient's Global Assessment:</b></p><br>
					<p align="center">Mark an X on the line below to indicate disease activity (independent of the patient's self assessment): <br>
						VERY WELL
							<form:radiobutton required="true" value="1" path="PGA" />1 
							<form:radiobutton required="true" value="2" path="PGA" />2 
							<form:radiobutton required="true" value="3" path="PGA" />3 
							<form:radiobutton required="true" value="4" path="PGA" />4
							<form:radiobutton required="true" value="5" path="PGA" />5
							<form:radiobutton required="true" value="6" path="PGA" />6
							<form:radiobutton required="true" value="7" path="PGA" />7
							<form:radiobutton required="true" value="8" path="PGA" />8
							<form:radiobutton required="true" value="9" path="PGA" />9
							<form:radiobutton required="true" value="10" path="PGA" />10
						&nbsp VERY POORLY
					</p><br><br>
					<p>
						<b>If Diagnosis is RA:</b>
					<p>
								
					<p>
						&nbsp&nbsp&nbsp&nbsp&nbsp <b>Click the radio button if there is 'none'</b>
					<p>
					<br>
					
					<table border="1px" class="navigation" style="margin:0px auto;" width="400">
						<tr>
							<td></td>
							<th colspan="2" style="font-size:12px;width:400px;"><b>LEFT</b></th>
							<th colspan="2" style="font-size:12px;width:400px;"><b>RIGHT</b></th>
						</tr>	
								
						<tr>
							<td></td>
							<th style="font-size:12px;width:400px;">SWOLLEN</th>
							<th style="font-size:12px;width:400px;">TENDER</th>
							<th style="font-size:12px;width:400px;">SWOLLEN</th>
							<th style="font-size:12px;width:400px;">TENDER</th>
						</tr>	
								
						<tr>
							<td><b>Shoulder</b></td>
							<form:hidden path="joints[0].jointName" value="Shoulder"/>
							<form:hidden path="joints[0].side" value="left"/>
								<td>
									<form:checkbox value="1" path="joints[0].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[0].pain" /> 
								</td>
							<form:hidden path="joints[1].jointName" value="Shoulder"/>
							<form:hidden path="joints[1].side" value="right"/>
								<td>
									<form:checkbox value="1" path="joints[1].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[1].pain" /> 
								</td>
						</tr>	
								
						<tr>
							<td><b>Elbow</b></td>
							<form:hidden path="joints[2].jointName" value="Elbow"/>
							<form:hidden path="joints[2].side" value="left"/>
								<td>
									<form:checkbox value="1" path="joints[2].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[2].pain" /> 
								</td>
							<form:hidden path="joints[3].jointName" value="Elbow"/>
							<form:hidden path="joints[3].side" value="right"/>
								<td>
									<form:checkbox value="1" path="joints[3].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[3].pain" /> 
								</td>
						</tr>
						
						<tr>
							<td><b>Wrist</b></td>
							<form:hidden path="joints[4].jointName" value="Wrist"/>
							<form:hidden path="joints[4].side" value="left"/>
								<td>
									<form:checkbox value="1" path="joints[4].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[4].pain" /> 
								</td>
							<form:hidden path="joints[5].jointName" value="Wrist"/>
							<form:hidden path="joints[5].side" value="right"/>
								<td>
									<form:checkbox value="1" path="joints[5].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[5].pain" /> 
								</td>
						</tr>
								
						<tr>
							<td colspan="5"></td>
						</tr>
								
						<tr>
							<td colspan="5"><b>Metacarpopahalangeal (MCP)</b></td>
						</tr>
							
						<tr>
							<td><b>1</b></td>
							<form:hidden path="joints[6].jointName" value="MCP I"/>
							<form:hidden path="joints[6].side" value="left"/>
								<td>
									<form:checkbox value="1" path="joints[6].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[6].pain" /> 
								</td>
							<form:hidden path="joints[7].jointName" value="MCP I"/>
							<form:hidden path="joints[7].side" value="right"/>
								<td>
									<form:checkbox value="1" path="joints[7].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[7].pain" /> 
								</td>
						</tr>
								
						<tr>
							<td><b>2</b></td>
							<form:hidden path="joints[8].jointName" value="MCP II"/>
							<form:hidden path="joints[8].side" value="left"/>
								<td>
									<form:checkbox value="1" path="joints[8].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[8].pain" /> 
								</td>
							<form:hidden path="joints[9].jointName" value="MCP II"/>
							<form:hidden path="joints[9].side" value="right"/>
								<td>
									<form:checkbox value="1" path="joints[9].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[9].pain" /> 
								</td>
						</tr>
								
						<tr>
							<td><b>3</b></td>
							<form:hidden path="joints[10].jointName" value="MCP III"/>
							<form:hidden path="joints[10].side" value="left"/>
								<td>
									<form:checkbox value="1" path="joints[10].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[10].pain" /> 
								</td>
							<form:hidden path="joints[11].jointName" value="MCP III"/>
							<form:hidden path="joints[11].side" value="right"/>
								<td>
									<form:checkbox value="1" path="joints[11].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[11].pain" /> 
								</td>
						</tr>
								
						<tr>
							<td><b>4</b></td>
							<form:hidden path="joints[12].jointName" value="MCP IV"/>
							<form:hidden path="joints[12].side" value="left"/>
								<td>
									<form:checkbox value="1" path="joints[12].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[12].pain" /> 
								</td>
							<form:hidden path="joints[13].jointName" value="MCP IV"/>
							<form:hidden path="joints[13].side" value="right"/>
								<td>
									<form:checkbox value="1" path="joints[13].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[13].pain" /> 
								</td>
						</tr>
								
						<tr>
							<td><b>5</b></td>
							<form:hidden path="joints[14].jointName" value="MCP V"/>
							<form:hidden path="joints[14].side" value="left"/>
								<td>
									<form:checkbox value="1" path="joints[14].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[14].pain" /> 
								</td>
							<form:hidden path="joints[15].jointName" value="MCP V"/>
							<form:hidden path="joints[15].side" value="right"/>
								<td>
									<form:checkbox value="1" path="joints[15].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[15].pain" /> 
								</td>
						</tr>
								
						<tr>
							<td colspan="5"></td>
						</tr>
								
						<tr>
							<td colspan="5"><b>Proximal Interphalangeal (PIP)</b></td>
						</tr>
							
						<tr>
							<td><b>1</b></td>
							<form:hidden path="joints[16].jointName" value="PIP I"/>
							<form:hidden path="joints[16].side" value="left"/>
								<td>
									<form:checkbox value="1" path="joints[16].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[16].pain" /> 
								</td>
							<form:hidden path="joints[17].jointName" value="PIP I"/>
							<form:hidden path="joints[17].side" value="right"/>
								<td>
									<form:checkbox value="1" path="joints[17].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[17].pain" /> 
								</td>
						</tr>
								
						<tr>
							<td><b>2</b></td>
							<form:hidden path="joints[18].jointName" value="PIP II"/>
							<form:hidden path="joints[18].side" value="left"/>
								<td>
									<form:checkbox value="1" path="joints[18].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[18].pain" /> 
								</td>
							<form:hidden path="joints[19].jointName" value="PIP II"/>
							<form:hidden path="joints[19].side" value="right"/>
								<td>
									<form:checkbox value="1" path="joints[19].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[19].pain" /> 
								</td>
						</tr>
								
						<tr>
							<td><b>3</b></td>
							<form:hidden path="joints[20].jointName" value="PIP III"/>
							<form:hidden path="joints[20].side" value="left"/>
								<td>
									<form:checkbox value="1" path="joints[20].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[20].pain" /> 
								</td>
							<form:hidden path="joints[21].jointName" value="PIP III"/>
							<form:hidden path="joints[21].side" value="right"/>
								<td>
									<form:checkbox value="1" path="joints[21].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[21].pain" /> 
								</td>
						</tr>
								
						<tr>
							<td><b>4</b></td>
							<form:hidden path="joints[22].jointName" value="PIP IV"/>
							<form:hidden path="joints[22].side" value="left"/>
								<td>
									<form:checkbox value="1" path="joints[22].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[22].pain" /> 
								</td>
							<form:hidden path="joints[23].jointName" value="PIP IV"/>
							<form:hidden path="joints[23].side" value="right"/>
								<td>
									<form:checkbox value="1" path="joints[23].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[23].pain" /> 
								</td>
						</tr>
								
						<tr>
							<td><b>5</b></td>
							<form:hidden path="joints[24].jointName" value="PIP V"/>
							<form:hidden path="joints[24].side" value="left"/>
								<td>
									<form:checkbox value="1" path="joints[24].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[24].pain" /> 
								</td>
							<form:hidden path="joints[25].jointName" value="PIP V"/>
							<form:hidden path="joints[25].side" value="right"/>
								<td>
									<form:checkbox value="1" path="joints[25].swelling" />
								</td>
								<td>
									<form:checkbox value="1" path="joints[25].pain" /> 
								</td>
						</tr>
								
					</table>								
					<br>
					
					<p align="center"><b>DAS28</b> = 0.56*&radic;(28TJC) + &radic;(28SJC) + 0.70*Ln(ESR/CRP) + 0.14*VAS</p><br><br>
							
					<p align=""><b>How to calculate a DAS28 score:</b></p><br>
					<p align="">
						1. Ask the patient to make a vertical mark on 100 mm Visual Analog Scale (VAS) corresponding to their general
							health or global disease activity. Using a ruler, measure from the left-hand side in mm. Note: DAS 28 
							calculations may be performed without a VAS measurement.<br><br>
						2. Perform a swollen and tender joint examination on your patient. Add all of the swollen and tender joints and
							record the totals in the appropriate boxes.<br><br>
						3. Erythrocyte Sedimentation Rate(ESR) should be measured (in mm/hour). Note: C-reactive protein (CRP) levels
							maybe used as substitute for an ESR.<br><br>
						4. Plug the appropriate values into the formula (many online calculators are available including
							<br> <a href="http://www.das-score.nl/www.das-score.nl/dasculators.html">http://www.das-score.nl/www.das-score.nl/dasculators.html</a>) <br><br>
						5. If using CRP instead of ESR or calculating a score from only 3 variables please see 
							<br> <a href="http://www.reuma-nijmegen.nl/www.das-score.nl/">http://www.reuma-nijmegen.nl/www.das-score.nl/</a> 
							for the approriate formula. <br><br>
					</p><br><br>
					
					<p align=""><b>Interpretation:</b></p><br>
					<p align="">
						<b>&bull;</b> The DAS28 provides you with a number on a scale from 0 to 10 indicating current RA disease activity.<br><br>
						<b>&bull;</b> Remission: DAS28 <= 2.6<br><br>
						<b>&bull;</b> Low Disease activity: 2.6 < DAS28 <= 3.2<br><br>
						<b>&bull;</b> Moderate Disease Activity: 3.2 < DAS28 <= 5.1<br><br>
						<b>&bull;</b> High Disease Activity: DAS28 > 5.1<br><br>
					</p><br><br>
					
					<table border="1px" class="navigation" style="margin:0px auto;">	
						<tr>
							<td style="font-size:10px;width:130px;"><form:input size="1" maxlength="3" path="vas" value="${form.getVas()}" /><b>: VAS (0-100)</b></td>
							<td style="font-size:10px;width:130px;">*Autocomputed*<b>: 28TJC</b></td>
							<td style="font-size:10px;width:130px;">*Autocomputed*<b>: 28SJC</b></td>
							<td style="font-size:10px;width:130px;"><form:input size="1" maxlength="3" path="esr" value="${form.getEsr()}" /><b>: ESR</b></td>
						</tr>
						
						<tr>
							<td colspan="4" style="font-size:12px;width:400px;"><b>DAS28:</b>*Autocomputed*</td>
						</tr>							
					</table>								
					<br><br><br>
					
					<section>
						<ul class="btnForm">
							<span class="btn"><input type="submit"
									value="Save" class="btnSave"></span></li>
							<a href="das_table.it?id=${patient.getId() }"><span class="btn"><input type="button"
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