<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Create Transaction</title>
	<meta charset="utf-8">
</head>

<body>
<div id="wrap">
<c:choose>
	<c:when test="${nurse != null }">
		<jsp:include page="../../headers/nurse-header.jsp">
			<jsp:param name="title" value="Doctor Home" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../../headers/doctor-header.jsp">
			<jsp:param name="title" value="Doctor Home" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:otherwise>
</c:choose>

<div class="pageCtrl">

</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	<div class="wrapper prospects">
		<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="transactions" />
			</jsp:include>
 
		<div class="tab-content">
			<section class="settingBody clrfix">		
			<div class = "left">
				<jsp:include page="../../headers/patient-left.jsp" />
			</div>

			
						
						<div class="right">				
								<p class="titles">Transaction</p><br><br>
								<form:form action="update_transaction.it?pid=${patient.getId() }&fid=${form.getId() }" method="post" commandName="form">
				<form:hidden path="id" value="${form.getId() }"/>
			<form:hidden path="patient.id" value="${patient.getId() }" />
			<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
			<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
			<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
				
							<ul>
								<h4>Receipt Number</h4><br>
								<form:textarea value="${ form.getReceiptNumber() }" path="receiptNumber" style="width:200px;height:20px;"/><br><br>
								
								<h4>TIN Number Number</h4><br>
								<form:textarea value="${ form.getTinNumber() }" path="tinNumber" style="width:200px;height:20px;"/><br><br>
								
								<p>Has HMO form</p> <form:checkbox path="hasHMO" />
								
								<br><br>
								
								<table class="tablecontent">
									<tr>
											<th class="pro" align="center">Description&nbspof&nbspService</th>
											<th class="phn" align="center">Charges</th>
											<th class="ind" align="center">Payments</th>
									</tr>
								<c:forEach begin="0" end="9" varStatus="i" >
										<tr>					
											<td class="pro" align="center"><span><form:textarea value="${form.getService()[i.index]}" path="service[${i.index }]" style="width:200px;height:20px;"/></span></td>
											<td class="phn" align="center"><span><form:textarea value="${form.getCharges()[i.index] }" path="charges[${i.index }]" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" placeholder="P" style="width:100px;height:20px;"/></span></td>
											<td class="ind" align="center"><span><form:textarea value="${form.getPayment()[i.index] }" path="payment[${i.index }]"  pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" placeholder="P" style="width:100px;height:20px;"/></span></td>							
										</tr>
								</c:forEach>
								</table>
							</ul>	
						<br/><br/><br/><br/>				
						<section>
							<ul class="btnForm">
								<span class="btn"><input type="submit"
										value="Save" class="btnSave"></span>
								<a href="view_transaction.it?pid=${patient.getId() }&fid=${form.getId()}"><span class="btn"><input type="button"
										value="Cancel" class="btnCancel" onClick="viewPotentialsList()"></span></a>
								<font style="padding-left:360px"></font>	
								<span class="btn"><input type="button"
									value="Back to Top" class="btnTop"></span>
							</ul>
					</section>

			</form:form>
						</div>
					</section>  	
					
					<div class="lowernav1">

					</div>					
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