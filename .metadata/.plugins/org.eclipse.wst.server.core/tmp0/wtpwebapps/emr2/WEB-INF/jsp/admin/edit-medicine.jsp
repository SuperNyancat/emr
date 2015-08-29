<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	</head>

<body>

<div id="wrap">
<jsp:include page="../headers/admin-header.jsp">
	<jsp:param name="title" value="Edit Medicine" />
	<jsp:param name="selected" value="medicines" />
</jsp:include>

<div class="pageCtrl">

<ul class="ctrlBtn listSpace">
</ul>
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper">
	

	

	<form:form method="post" class="crmForm" commandName="medicine" action="update_medicine.it?id=${medicine.getId() }">
			
            <section class="settingBody clrfix">		
			<div class = "left">
				<jsp:include page="../headers/admin-left.jsp" />
			</div>
			
			<div class="right">			
			<h4>Edit Medicine</h4>
				Generic Name:<form:input type="text" path="genericName" required="true" value="${medicine.getGenericName() }"/><br>
				Brand Name:<form:input type="text" path="brandName" required="true" value="${medicine.getBrandName() }"/><br></br>
				Uses: <form:textarea rows="4" cols="50" style="width:500px; height:100px;" path="uses" value="${medicine.getUses() }"/><br></br>
				Side Effects: <form:textarea rows="4" cols="50" style="width:500px; height:100px;" path="sideEffects" value="${medicine.getSideEffects() }" /><br>	
			<br/><br/><br/><br/>
			
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Save" class="btnSave"></span>
					<a href="view_medicines.it"><span class="btn"><input type="button"
							value="Cancel" class="btnCancel" onClick="viewPotentialsList()"></span></a>
				<font style="padding-left:360px"></font>	
					<span class="btn"><input type="button"
						value="Back to Top" class="btnTop"></span>
				</ul>
			</section>
			
			</form:form>
			
			
			
			</div>
		</section>			
			
	
		

	</form>

	
	
	
</div>
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>

</body>
</html>