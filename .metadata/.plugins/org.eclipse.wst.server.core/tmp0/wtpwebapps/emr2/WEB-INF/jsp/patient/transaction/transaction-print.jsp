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

							<h4 style="text-align:center; font-size:20px;"><b>University of Santo Tomas Hospital<br>Joint and Bone Center</h4>
							<h4 style="text-align:center; font-size:18px;"><b>Medical Billing</h4>
								
							<hr>
							
							<table style="font-size:16px; align:center; margin:0px auto;">
							<tr>
								<td><b>DESCRIPTION&nbspOF&nbspSERVICE</td>
								<td style="padding-left:80px"><b>CHARGES</td>
								<td style="padding-left:80px"><b>PAYMENTS</td>					
							</tr>

							<c:forEach begin="0" end="${length}" varStatus="i" >
							<tr>					
								<td>${form.getService()[i.index]}</td>
								<td style="padding-left:80px">
									<c:if test="${form.getCharges()[i.index] != null }">P</c:if>
										 ${form.getCharges()[i.index] }</td>
								<td style="padding-left:80px">
										<c:if test="${form.getPayment()[i.index] != null }">P</c:if>
										 ${form.getPayment()[i.index] }
								</td>																			
							</tr>
										</c:forEach>													
							</table>	
							<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
							<br><br><br><br><br><br><br><br><br><br><br><br>
							<hr>
							<label>Balance: P ${form.getBalance() } </label><br>
							<label>Receipt Number: ${form.getReceiptNumber() } </label><br>
							<label>Tin Number: ${form.tinNumber } </label> <br>
							<label>
								<c:choose><c:when  test="${form.hasHMO == true}">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>
								<p>Has HMO form</p>
						</label>
				

</body>
</html>