<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Edit CDAI Form</title>
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
			<p class="titles">Clinical Disease Activity Index</p><br>	
				<form:form action="cdai_update.it?pid=${patient.getId()}&fid=${form.getId()}" method="post" commandName="form">
<form:hidden path="id" value="${form.getId() }"/>
						<form:hidden path="patient.id" value="${patient.getId()}"/>
						<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
						<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
						<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
						
<br><br>										<p align="center"><i>0 - Absent 1 - Present</i></p>							
									<table border="1px" class="navigation" style="margin:0px auto;">
									<tr>
										<td colspan="3" style="text-align:center"><b>Left</b></td>
										<td colspan="3" style="text-align:center"><b>Right</b></td>
									</tr>
									
									<tr>
										<td><b>Joint</b></td>
										<td style="text-align:center"><b>Tender</b></td>
										<td style="text-align:center"><b>Swollen</b></td>
										<td><b>Joint</b></td>
										<td style="text-align:center"><b>Tender</b></td>
										<td style="text-align:center"><b>Swollen</b></td>
									</tr>
									
									<tr>
										<td><b>Shoulder</b></td>
											<form:hidden path="joints[0].jointName" value="Shoulder"/>
											<form:hidden path="joints[0].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joints[0].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[0].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>Shoulder</b></td>
											<form:hidden path="joints[1].jointName" value="Shoulder"/>
											<form:hidden path="joints[1].side" value="right"/>										
										<td>
											<form:checkbox value="1" path="joints[1].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[1].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									
									<tr>
										<td><b>Elbow</b></td>
											<form:hidden path="joints[2].jointName" value="Elbow"/>
											<form:hidden path="joints[2].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joints[2].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[2].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>Elbow</b></td>
											<form:hidden path="joints[3].jointName" value="Elbow"/>
											<form:hidden path="joints[3].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joints[3].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[3].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>Wrist</b></td>
											<form:hidden path="joints[4].jointName" value="Wrist"/>
											<form:hidden path="joints[4].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joints[4].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[4].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>Wrist</b></td>
											<form:hidden path="joints[5].jointName" value="Wrist"/>
											<form:hidden path="joints[5].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joints[5].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[5].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>MCP 1</b></td>
											<form:hidden path="joints[6].jointName" value="MCP1"/>
											<form:hidden path="joints[6].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joints[6].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[6].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>MCP 1</b></td>
											<form:hidden path="joints[7].jointName" value="MCP1"/>
											<form:hidden path="joints[7].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joints[7].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[7].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td><b>MCP 2</b></td>
											<form:hidden path="joints[8].jointName" value="MCP2"/>
											<form:hidden path="joints[8].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joints[8].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[8].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>MCP 2</b></td>
											<form:hidden path="joints[9].jointName" value="MCP2"/>
											<form:hidden path="joints[9].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joints[9].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[9].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td></tr>

									<tr>
										<td><b>MCP 3</b></td>
											<form:hidden path="joints[10].jointName" value="MCP3"/>
											<form:hidden path="joints[10].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joints[10].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[10].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>MCP 3</b></td>
											<form:hidden path="joints[11].jointName" value="MCP3"/>
											<form:hidden path="joints[11].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joints[11].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[11].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>MCP 4</b></td>
											<form:hidden path="joints[12].jointName" value="MCP4"/>
											<form:hidden path="joints[12].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joints[12].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[12].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>MCP 4</b></td>
											<form:hidden path="joints[13].jointName" value="MCP4"/>
											<form:hidden path="joints[13].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joints[13].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[13].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>			

									<tr>
										<td><b>MCP 5</b></td>
											<form:hidden path="joints[14].jointName" value="MCP5"/>
											<form:hidden path="joints[14].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joints[14].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[14].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>MCP 5</b></td>
											<form:hidden path="joints[15].jointName" value="MCP5"/>
											<form:hidden path="joints[15].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joints[15].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[15].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>	

									<tr>
										<td><b>PIP 1</b></td>
											<form:hidden path="joints[16].jointName" value="PIP1"/>
											<form:hidden path="joints[16].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joints[16].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[16].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>PIP 1</b></td>
											<form:hidden path="joints[17].jointName" value="PIP1"/>
											<form:hidden path="joints[17].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joints[17].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[17].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>PIP 2</b></td>
											<form:hidden path="joints[18].jointName" value="PIP2"/>
											<form:hidden path="joints[18].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joints[18].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[18].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>PIP 2</b></td>
											<form:hidden path="joints[19].jointName" value="PIP2"/>
											<form:hidden path="joints[19].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joints[19].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[19].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>PIP 3</b></td>
											<form:hidden path="joints[20].jointName" value="PIP3"/>
											<form:hidden path="joints[20].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joints[20].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[20].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>PIP 3</b></td>
											<form:hidden path="joints[21].jointName" value="PIP3"/>
											<form:hidden path="joints[21].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joints[21].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[21].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>PIP 4</b></td>
											<form:hidden path="joints[22].jointName" value="PIP4"/>
											<form:hidden path="joints[22].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joints[22].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[22].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>PIP 4</b></td>
											<form:hidden path="joints[23].jointName" value="PIP4"/>
											<form:hidden path="joints[23].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joints[23].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[23].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>PIP 5</b></td>
											<form:hidden path="joints[24].jointName" value="PIP5"/>
											<form:hidden path="joints[24].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joints[24].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[24].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>PIP 5</b></td>
											<form:hidden path="joints[25].jointName" value="PIP5"/>
											<form:hidden path="joints[25].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joints[25].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[25].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>Knee</b></td>
											<form:hidden path="joints[26].jointName" value="Knee"/>
											<form:hidden path="joints[26].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joints[26].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[26].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td><td><b>Knee</b></td>
											<form:hidden path="joints[27].jointName" value="Knee"/>
											<form:hidden path="joints[27].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joints[27].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joints[27].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>		

																
									</table>
									<br><br>
										
									<table border="1px" class="navigation" style="margin:0px auto;">
									<tr>
										<td colspan="7">
										<b>Patient Global Assessment of Disease Activity<br><br>Considering all the ways your arthritis affects you, rate how well you are doing on the following scale: 0 - Very Well to 10 - Very Poor<br><br>
										</td>										
									</tr>
									
									<tr>
									
										<tr>
											<td><form:radiobutton required="true" value="0" path="patientGlobalAssessment" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><form:radiobutton required="true" value="0.5" path="patientGlobalAssessment" />0.5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><form:radiobutton required="true" value="1.0" path="patientGlobalAssessment" />1.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><form:radiobutton required="true" value="1.5" path="patientGlobalAssessment" />1.5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><form:radiobutton required="true" value="2.0" path="patientGlobalAssessment" />2.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><form:radiobutton required="true" value="2.5" path="patientGlobalAssessment" />2.5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><form:radiobutton required="true" value="3.0" path="patientGlobalAssessment" />3.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</tr>
										
										<tr>
											<td><form:radiobutton required="true" value="3.5" path="patientGlobalAssessment" />3.5</td>
											<td><form:radiobutton required="true" value="4.0" path="patientGlobalAssessment" />4.0</td>
											<td><form:radiobutton required="true" value="4.5" path="patientGlobalAssessment" />4.5</td>
											<td><form:radiobutton required="true" value="5.0" path="patientGlobalAssessment" />5.0</td>
											<td><form:radiobutton required="true" value="5.5" path="patientGlobalAssessment" />5.5</td>
											<td><form:radiobutton required="true" value="6.0" path="patientGlobalAssessment" />6.0</td>
											<td><form:radiobutton required="true" value="6.5" path="patientGlobalAssessment" />6.5</td>
										</tr>
										
										<tr>
											<td><form:radiobutton required="true" value="7.0" path="patientGlobalAssessment" />7.0</td>
											<td><form:radiobutton required="true" value="7.5" path="patientGlobalAssessment" />7.5</td>
											<td><form:radiobutton required="true" value="8.0" path="patientGlobalAssessment" />8.0</td>
											<td><form:radiobutton required="true" value="8.5" path="patientGlobalAssessment" />8.5</td>
											<td><form:radiobutton required="true" value="9.0" path="patientGlobalAssessment" />9.0</td>
											<td><form:radiobutton required="true" value="9.5" path="patientGlobalAssessment" />9.5</td>
											<td><form:radiobutton required="true" value="10.0" path="patientGlobalAssessment" />10.0</td>
										</tr>										
									
									</tr>
									</table>
									<br><br>
									
									<table border="1px" class="navigation" style="margin:0px auto;">
									<tr>
										<td colspan="7">
										<b>Provider Global Assessment of Disease Activity<br><br>Considering all the ways your arthritis affects you, rate how well you are doing on the following scale: 0 - Very Well to 10 - Very Poor<br><br>
										</td>										
									</tr>
									
									<tr>
									
										<tr>
											<td><form:radiobutton required="true" value="0" path="providerGlobalAssessment" />0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><form:radiobutton required="true" value="0.5" path="providerGlobalAssessment" />0.5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><form:radiobutton required="true" value="1.0" path="providerGlobalAssessment" />1.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><form:radiobutton required="true" value="1.5" path="providerGlobalAssessment" />1.5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><form:radiobutton required="true" value="2.0" path="providerGlobalAssessment" />2.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><form:radiobutton required="true" value="2.5" path="providerGlobalAssessment" />2.5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><form:radiobutton required="true" value="3.0" path="providerGlobalAssessment" />3.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</tr>
										
										<tr>
											<td><form:radiobutton required="true" value="3.5" path="providerGlobalAssessment" />3.5</td>
											<td><form:radiobutton required="true" value="4.0" path="providerGlobalAssessment" />4.0</td>
											<td><form:radiobutton required="true" value="4.5" path="providerGlobalAssessment" />4.5</td>
											<td><form:radiobutton required="true" value="5.0" path="providerGlobalAssessment" />5.0</td>
											<td><form:radiobutton required="true" value="5.5" path="providerGlobalAssessment" />5.5</td>
											<td><form:radiobutton required="true" value="6.0" path="providerGlobalAssessment" />6.0</td>
											<td><form:radiobutton required="true" value="6.5" path="providerGlobalAssessment" />6.5</td>
										</tr>
										
										<tr>
											<td><form:radiobutton required="true" value="7.0" path="providerGlobalAssessment" />7.0</td>
											<td><form:radiobutton required="true" value="7.5" path="providerGlobalAssessment" />7.5</td>
											<td><form:radiobutton required="true" value="8.0" path="providerGlobalAssessment" />8.0</td>
											<td><form:radiobutton required="true" value="8.5" path="providerGlobalAssessment" />8.5</td>
											<td><form:radiobutton required="true" value="9.0" path="providerGlobalAssessment" />9.0</td>
											<td><form:radiobutton required="true" value="9.5" path="providerGlobalAssessment" />9.5</td>
											<td><form:radiobutton required="true" value="10.0" path="providerGlobalAssessment" />10.0</td>
										</tr>										
									
									</tr>
									</table>	
									<br><br>
				
					
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Update Form" class="btnSave"></span>
					<a href="view_cdai.it?pid=${patient.getId() }&fid=${form.id}"><span class="btn"><input type="button"
							value="Cancel" class="btnCancel" onClick="viewPotentialsList()"></span></a>
					<span class="btn"><input type="button"
						value="Back to Top" class="btnTop"></span>
					<font style="padding-left:360px"></font>
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
	<span class="copy"><a href=""> All Rights Reserved. </a></span>
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>
</div>
</body>
</html>