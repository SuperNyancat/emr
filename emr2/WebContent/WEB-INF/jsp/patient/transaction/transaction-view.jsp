<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>Transaction</title>
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
	<ul class="ctrlBtn">
	<li><span class="btn">
		<form:form commandName="form" action="edit_transaction.it" method="GET">
			<form:hidden path="patient.id" value="${patient.id }" />
			<form:hidden path="id" value="${form.id }" />
			<input type="submit" value="Edit" class="btnEdit" />
		</form:form>
	</span></li>
	
	<li><span class="btn"><input type="button" name="answer" value="Delete" onclick="showDiv()" class="btnDel"/></span></li>			
</ul>

	<div align="center" id="welcomeDiv"  style="display:none; background:red; padding-left:20px" class="answer_list" >
		<p style="color:white; font-size:15px; padding-top:10px;">Are you sure you want to delete?</p><br>
		<span class="btn">
			<form:form commandName="form" action="delete_transaction.it" method="GET">
				<form:hidden path="patient.id" value="${patient.id }" />
				<form:hidden path="id" value="${form.id }" />
				<input type="submit" value="OK" class="btnDel"/>
			</form:form>	
		</span>
		<span class="btn"><input type="button" value="Cancel" onclick="hideDiv()" class="btnCancel"/></span>
		<br>
	</div>
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper">		

	
	<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="transactions" />
			</jsp:include>
	
		<form class="crmForm">
			<div class="tab-content">
				<section class="settingBody clrfix">		
					<div class = "left">
						<jsp:include page="../../headers/patient-left.jsp" />
					</div>
					
					<div class="right">				
							<p class="titles">Medical Bill</p><br><br>
								<ul>
									<h4>Receipt Number</h4><br>
									<p>${form.getReceiptNumber() }</p><br><br>
									
									<h4>TIN Number</h4><br>
									<p>${form.tinNumber }</p><br><br>
									
							<c:choose><c:when  test="${form.hasHMO == true}">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>
								<p>Has HMO form</p>
								<br><br>
									
									<h4>Transaction Details</h4><br>
									<table class="tablecontent">
										<tr>
												<th class="phn" align="center" style="color:#006300;width:250px;">Description&nbspof&nbspService</th>
												<th class="ind" align="center" style="color:#006300;">Charges</th>
												<th class="ind" align="center" style="color:#006300;">Payments</th>
												
										</tr>
										<c:forEach begin="0" end="${length}" varStatus="i" >
											<tr>					
												<td class="phn" align="center"><span>${form.getService()[i.index]}</span></td>
												<td class="ind" align="center"><span>
													<c:if test="${form.getCharges()[i.index] != null }">P</c:if>
													 ${form.getCharges()[i.index] }</span></td>
												<td class="ind" align="center"><span>
													<c:if test="${form.getPayment()[i.index] != null }">P</c:if>
													 ${form.getPayment()[i.index] }</span></td>
																			
											</tr>
										</c:forEach>
										
										
											
									</table>
									<label style="padding-left:580px">Balance: P ${form.getBalance() } </label>
								</ul>			
								
								<br><br>
								<ul class="ctrlBtn listSpace">
									<li><span class="btn"><a href="transaction_print.it?pid=${patient.getId() }&fid=${form.getId()}"><input type="button" value="Print" class="btnEdit" style="right-align"></a></span></li>
								</ul>								
					</div>
			
					</section>
					<div class="lowernav1">
						<section class="paging">
							<ul>
							<c:if test="${ form.getRevisionHistory().getDateModified() != null}">
								<li><label>Date Modified</label>:  <span>${ form.getRevisionHistory().getDateModified() }</span></li> |
								<li><label>Modified By</label>:  <span>${ form.getRevisionHistory().getModifiedBy().getUsername() }</span></li>
							</c:if>
								<br/>
								<li><label>Date Created</label>:  <span>${ form.getRevisionHistory().getDateCreated() }</span></li> |
								<li><label>Created By</label>:  <span>${ form.getRevisionHistory().getCreatedBy().getUsername() }</span></li>
							</ul>
						</section>
					</div>		
				</div>
			</div>
		</form>
		
	</div>
	
		
</div>
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>
<script>
	function showDiv() {
   document.getElementById('welcomeDiv').style.display = "block";
	}

	function hideDiv() {
   document.getElementById('welcomeDiv').style.display = "none";
	}
</script>
</body>
</html>