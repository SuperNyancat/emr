<!--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
-->

<!doctype html>
<html lang="en">
<head>
	<title></title>
	<meta charset="utf-8">
	

</head>

<body>

							<h4 style="text-align:center; font-size:13px;"><b>MILLICENT Y. TAN-ONG, M.D., FPCP, FPRA<br>Certified Clinical Densitometrist (CCD) by the<br>International Society for Clinical Densitometry (ISCD)</h4>
							<h4 style="text-align:center; font-size:11px;"><b>INTERNAL MEDICINE - RHEUMATOLOGY<br>AUTOIMMUNE DISEASES - OSTEOPOROSIS - VASCULITIS</h4>	

							<table style="font-size:9px">
							<tr>
								<td>CARDINAL SANTOS</td>
								<td style="padding-left:100px;">UST HOSPITAL</td>
							</tr>
							
							<tr>
								<td>MEDICAL CENTER</td>
								<td style="padding-left:100px;">Clinical Division</td>
							</tr>	

							<tr>
								<td>MAB 3 Ground Flr.</td>
								<td style="padding-left:100px;">4th Flr. Rm. 433</td>
							</tr>	

							<tr>
								<td>Room 175</td>
								<td style="padding-left:100px;">Tues 10am-1pm</td>
							</tr>								

							<tr>
								<td>Wed 10am- 1pm</td>
								<td style="padding-left:100px;">Fri. 1-4 pm</td>
							</tr>								

							<tr>
								<td>Sat. 2 - 4 pm</td>
								<td style="padding-left:100px;">Tel. 731-3001 loc. 2410</td>
							</tr>								

							<tr>
								<td>Tel. 731-3001 loc. 2410</td>
								<td style="padding-left:100px;"></td>
							</tr>								

							<tr>
								<td>727-0001 loc. 2175</td>
								<td style="padding-left:100px;"></td>
							</tr>															
							</table>
							<hr>
							<p style="padding-left:900px;">2014</p>
							<img src="resources/images/rx.png">
							
							<table style="font-size:16px; align:center; margin:0px auto;">
							<tr>
								<td><b>GENERIC NAME</td>
								<td style="padding-left:80px"><b>BRAND NAME</b></td>
								<td style="padding-left:80px"><b>DOSAGE</b></td>
								<td style="padding-left:80px"><b>DURATION</b></td>
								<td style="padding-left:80px"><b>OTHER DETAILS</b></td>						
							</tr>
							
								
							<c:forEach items="${form.getMedications() }" var="medication">
								<tr>
									<td class="phn"><span>${ medication.getGenericName() }</span></td>
									<td class="phn"><span>${ medication.getBrandName() }</span></td>
									<td class="phn"><span>${ medication.getDosage() }</span></td>
									<td class="phn"><span>${ medication.getDuration() }</span></td>
									<td class="phn"><span>${ medication.getOtherDetails() }</span></td>
								</tr>
							</c:forEach>
							</table>
							
							<br><br><br><br><br><br><br><br><br><br><br><br>
							<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
							<p>Others:</p>
							<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
							
							<table style="font-size:16px; align:center; margin:0px auto;">
							<tr>
								<td>To come back on:</td>
								<td style="padding-left:580px">Millicent Y. Tan-Ong, M.D.</td>
							</tr>
							
							<tr>
								<td></td>
								<td style="padding-left:580px">License No. </td>
							</tr>

							<tr>
								<td></td>
								<td style="padding-left:580px">PTR No. </td>
							</tr>							
							</table>
	

</body>
</html>