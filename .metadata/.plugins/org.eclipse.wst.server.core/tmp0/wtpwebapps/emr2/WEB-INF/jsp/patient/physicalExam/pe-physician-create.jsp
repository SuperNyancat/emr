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

<jsp:include page="../../headers/doctor-header.jsp">
	<jsp:param name="title" value="New Physician's Assessment" />
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
			<jsp:param name="selected" value="forms" />
			</jsp:include>
		
			<div class="tab-content">
				<div id="History" class="tab active">           
					<section class="settingBody clrfix">		
						<div class = "left">
							<jsp:include page="../../headers/patient-left.jsp" />
						</div>	
			
					<div class="right">
						<form:form action="ped_create.it?id=${patient.id }" commandName="form" method="post">
								<p class="titles">Physician's Assessment</p><br>
								<p align="center"><i>0 - ABSENT 1 - PRESENT</i></p>
								<table border="1px" class="navigation" style="margin:0px auto;">
								<tr>
									<th colspan="4" align="center"><b>PATIENT RIGHT</b></th>
									<th colspan="4" align="center"><b>PATIENT LEFT</b></th>
								</tr>
								
								<tr>
									<th><center>Joint</center></th>
									<th align="right"><center>Pain</center></th>
									<th align="right"><center>Swelling</center></th>
									
									<th><center>Joint</center></th>
									<th align="right"><center>Pain</center></th>
									<th align="right"><center>Swelling</center></th>									
								</tr>
								
								<tr>
										<td><b>Shoulder</b></td>
											<form:hidden path="joint[0].jointName" value="Shoulder"/>
											<form:hidden path="joint[0].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joint[0].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[0].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>Shoulder</b></td>
											<form:hidden path="joint[1].jointName" value="Shoulder"/>
											<form:hidden path="joint[1].side" value="right"/>										
										<td>
											<form:checkbox value="1" path="joint[1].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[1].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									
									<tr>
										<td><b>Elbow</b></td>
											<form:hidden path="joint[2].jointName" value="Elbow"/>
											<form:hidden path="joint[2].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joint[2].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[2].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>Elbow</b></td>
											<form:hidden path="joint[3].jointName" value="Elbow"/>
											<form:hidden path="joint[3].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joint[3].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[3].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>Wrist</b></td>
											<form:hidden path="joint[4].jointName" value="Wrist"/>
											<form:hidden path="joint[4].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joint[4].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[4].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>Wrist</b></td>
											<form:hidden path="joint[5].jointName" value="Wrist"/>
											<form:hidden path="joint[5].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joint[5].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[5].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>MCP 1</b></td>
											<form:hidden path="joint[6].jointName" value="MCP1"/>
											<form:hidden path="joint[6].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joint[6].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[6].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>MCP 1</b></td>
											<form:hidden path="joint[7].jointName" value="MCP1"/>
											<form:hidden path="joint[7].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joint[7].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[7].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td><b>MCP 2</b></td>
											<form:hidden path="joint[8].jointName" value="MCP2"/>
											<form:hidden path="joint[8].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joint[8].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[8].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>MCP 2</b></td>
											<form:hidden path="joint[9].jointName" value="MCP2"/>
											<form:hidden path="joint[9].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joint[9].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[9].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td></tr>

									<tr>
										<td><b>MCP 3</b></td>
											<form:hidden path="joint[10].jointName" value="MCP3"/>
											<form:hidden path="joint[10].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joint[10].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[10].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>MCP 3</b></td>
											<form:hidden path="joint[11].jointName" value="MCP3"/>
											<form:hidden path="joint[11].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joint[11].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[11].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>MCP 4</b></td>
											<form:hidden path="joint[12].jointName" value="MCP4"/>
											<form:hidden path="joint[12].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joint[12].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[12].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>MCP 4</b></td>
											<form:hidden path="joint[13].jointName" value="MCP4"/>
											<form:hidden path="joint[13].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joint[13].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[13].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>			

									<tr>
										<td><b>MCP 5</b></td>
											<form:hidden path="joint[14].jointName" value="MCP5"/>
											<form:hidden path="joint[14].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joint[14].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[14].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>MCP 5</b></td>
											<form:hidden path="joint[15].jointName" value="MCP5"/>
											<form:hidden path="joint[15].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joint[15].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[15].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>	

									<tr>
										<td><b>PIP 1</b></td>
											<form:hidden path="joint[16].jointName" value="PIP1"/>
											<form:hidden path="joint[16].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joint[16].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[16].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>PIP 1</b></td>
											<form:hidden path="joint[17].jointName" value="PIP1"/>
											<form:hidden path="joint[17].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joint[17].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[17].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>PIP 2</b></td>
											<form:hidden path="joint[18].jointName" value="PIP2"/>
											<form:hidden path="joint[18].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joint[18].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[18].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>PIP 2</b></td>
											<form:hidden path="joint[19].jointName" value="PIP2"/>
											<form:hidden path="joint[19].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joint[19].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[19].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>PIP 3</b></td>
											<form:hidden path="joint[20].jointName" value="PIP3"/>
											<form:hidden path="joint[20].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joint[20].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[20].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>PIP 3</b></td>
											<form:hidden path="joint[21].jointName" value="PIP3"/>
											<form:hidden path="joint[21].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joint[21].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[21].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>PIP 4</b></td>
											<form:hidden path="joint[22].jointName" value="PIP4"/>
											<form:hidden path="joint[22].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joint[22].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[22].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>PIP 4</b></td>
											<form:hidden path="joint[23].jointName" value="PIP4"/>
											<form:hidden path="joint[23].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joint[23].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[23].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>PIP 5</b></td>
											<form:hidden path="joint[24].jointName" value="PIP5"/>
											<form:hidden path="joint[24].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joint[24].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[24].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td><b>PIP 5</b></td>
											<form:hidden path="joint[25].jointName" value="PIP5"/>
											<form:hidden path="joint[25].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joint[25].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[25].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td><b>Knee</b></td>
											<form:hidden path="joint[26].jointName" value="Knee"/>
											<form:hidden path="joint[26].side" value="left"/>
										<td>
											<form:checkbox value="1" path="joint[26].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[26].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td><td><b>Knee</b></td>
											<form:hidden path="joint[27].jointName" value="Knee"/>
											<form:hidden path="joint[27].side" value="right"/>
										<td>
											<form:checkbox value="1" path="joint[27].pain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<form:checkbox value="1" path="joint[27].swelling" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>		
								
								</table>
								<br><br>
								<p align="center">Physician’s Global Assessment: Mark an X on the line below to indicate disease activity (independent of the patient’s self assessment):<br>
									VERY GOOD
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
									&nbsp VERY BAD</p><br><br>
			<table border="1px" class="navigation" style="margin:0px auto;">
				
				
				<tr>
					<td>Acute-Phase Reactant: ESR or CRP Today</td>
					<td><form:input size="1" maxlength="3" path="ESR_today" /></td>
				</tr>								

								
			</table>								
								<br><br><br>
								<section>
									<ul class="btnForm">
										<span class="btn"><input type="submit" value="Save" class="btnSave"></span>
										<a href="ped_table.it?id=${patient.id }"><span class="btn"><input type="button" value="Cancel" class="btnCancel" onClick=""></span></a>
										<font style="padding-left:400px"></font>
										<span class="btn"><input type="button" value="Back to Top" class="btnTop"></span>
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