<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>Forms</title>
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
	
	<div class="wrapper">		

	
	<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="forms" />
			</jsp:include>
	
		<form class="crmForm">
			<div class="tab-content">
				<section class="settingBody clrfix">		
					<div class = "left">
						<jsp:include page="../../headers/patient-left.jsp" />
					</div>
											
					<div class="right">
						<p class="titles">Create Medical Documents</p><br>
						<h4>Functional Abilities</h4>
						<table>
								<td><a href="pep_assemble.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p><a href="pep_assemble.it?id=${patient.getId() }">New Patient Assessment</a></p></td>						
								<td><a href="ped_assemble.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p><a href="ped_assemble.it?id=${patient.getId() }">New Physician Assessment</a></p></td>						
						</table><br><br>						
						
						<h4>Laboratory Request</h4>
						<table>
								<td><a href="laboratory_request_assembler.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p><a href="laboratory_request_assembler.it?id=${patient.getId() }">Laboratory Request</a></p></td>										
						</table><br><br>	
						
						<h4>Rheumatoid Arthritis</h4>
						<table>
								<td><a href="cdai_assemble.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p><a href="cdai_assemble.it?id=${patient.getId() }">New Clinical Disease Activity Index</a></p></td>										
								<td><a href="sdai_assemble.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p><a href="sdai_assemble.it?id=${patient.getId() }">New Simple Disease Activity Index</a></p></td>										
								<td><a href="das_assemble.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p><a href="das_assemble.it?id=${patient.getId() }">New Disease Activity Score in 28 Joints</a></p></td>										
						</table><br><br>	
						
						<h4>Systemic Lupus Erythematosus</h4>
						<table>		
							<td><a href="damage_index_form_assembler.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p style="padding-left:22px"><a href="damage_index_form_assembler.it?id=${patient.getId() }">New Damage Index</a></p></td>
							<td><a href="MEXSLEDAI_form_assembler.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p style="padding-left:22px"><a href="MEXSLEDAI_form_assembler.it?id=${patient.getId() }">New MEX SLEDAI</a></p></td>
							<td><a href="SLE_flowsheet_form_assembler.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p style="padding-left:18px"><a href="SLE_flowsheet_form_assembler.it?id=${patient.getId() }">New SLE Flow Sheet</a></p></td>		
							<td><a href="sle_flare_form_assembler.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p style="padding-left:28px"><a href="sle_flare_form_assembler.it?id=${patient.getId() }">New SLE Flare</a></p></td>		
							<td><a href="SLEDAA_case_report_form_assembler.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p><a href="SLEDAA_case_report_form_assembler.it?id=${patient.getId() }">New&nbspSLEDAA&nbspCase&nbspReport </a></p></td>							<td><a href="SLEDAI_score_form_assembler.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""  style="padding-right:110px"></a><br><p style="padding-left:26px"><a href="SLEDAI_score_form_assembler.it?id=${patient.getId() }">New SLEDAI Score</a></p></td>						
						</table>

						<h4>Ankylosing Spondylitis</h4>
						<table>	
							<tr>
								<td><a href="BASDAI_form_assembler.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p style="padding-left:32px"><a href="BASDAI_form_assembler.it?id=${patient.getId() }">New BASDAI</a></p></td>
								<td><a href="BASFI_form_assembler.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p style="padding-left:32px"><a href="BASFI_form_assembler.it?id=${patient.getId() }">New BASFI</a></p></td>
								<td><a href="basmi_assemble.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p style="padding-left:32px"><a href="basmi_assemble.it?id=${patient.getId() }">New BASMI</a></p></td>
								<td><a href="BASG_form_assembler.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p style="padding-left:32px"><a href="BASG_form_assembler.it?id=${patient.getId() }">New BAS-G</a></p></td>								
							</tr>						
						</table><br><br>		

						<h4>Psoriatic Arthritis</h4>
						<table>	
							<tr>
								<td><a href="pasi_assemble.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p style="padding-left:32px"><a href="pasi_assemble.it?id=${patient.getId() }">New PASI</a></p></td>								
							</tr>						
						</table><br><br>	

						<h4>Systemic Sclerosis</h4>											
							<table>
							<tr>						
								<td><a href="rodnan_assemble.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p style="padding-left:22px"><a href="rodnan_assemble.it?id=${patient.getId() }">New Modified Rodnan Score</a></p></td>
								<td><a href="eustar_assemble.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p style="padding-left:22px"><a href="eustar_assemble.it?id=${patient.getId() }">New EUSTAR</a></p></td>
								<td><a href="SS_flowsheet_form_assembler.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p style="padding-left:22px"><a href="SS_flowsheet_form_assembler.it?id=${patient.getId() }">New SS Flow Sheet</a></p></td>
							</tr>
							</table>						
						
						<h4>Inflammatory Myopathy</h4>
						<table>	
								<td><a href="inflammatory_myopath_form_assembler.it?id=${patient.getId() }"><img src="resources/images/newform.png" alt=""></a><br><p><a href="inflammatory_myopath_form_assembler.it?id=${patient.getId() }">New Inflammatory Myopathy</a></p></td>						
						</table><br><br>
						
						</div>
					
					
			
					</section>
					
				</div>
			</div>
		</form>
		
	</div>
	
		
</div>
	
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>

</body>
</html>