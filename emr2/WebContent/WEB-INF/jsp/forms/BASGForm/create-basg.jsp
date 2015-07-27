<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Create BASG Form</title>
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
				<p class="titles">The Bath Ankylosing Spondylitis Global Score (BAS-G)</p><br>	
			<form:form action="create_basg_form.it?id=${patient.getId() }" commandName="form" method="post">	
					<li><h3>IN A SCALE FROM "VERY GOOD" (0) TO "VERY BAD" (10):</h3>
					</li>
					<br>
					<li>1. How have you been over the last week?<br><br>
					<form:radiobutton  path="question1" value="0" required="true" />0 &nbsp 
					<form:radiobutton  path="question1" value="1" required="true" />1 &nbsp
					<form:radiobutton  path="question1" value="2" required="true" />2 &nbsp 
					<form:radiobutton  path="question1" value="3" required="true" />3 &nbsp 
					<form:radiobutton  path="question1" value="4" required="true" />4 &nbsp 
					<form:radiobutton  path="question1" value="5" required="true" />5 &nbsp 
					<form:radiobutton  path="question1" value="6" required="true" />6 &nbsp 
					<form:radiobutton  path="question1" value="7" required="true" />7 &nbsp 
					<form:radiobutton  path="question1" value="8" required="true" />8 &nbsp 
					<form:radiobutton  path="question1" value="9" required="true" />9 &nbsp 
					<form:radiobutton  path="question1" value="10" required="true" />10 &nbsp 					
					</li>
					<br><br>
					<li>2. How have you been over the last six months?<br><br>	
					<form:radiobutton  path="question2" value="0" required="true" />0 &nbsp 
					<form:radiobutton  path="question2" value="1" required="true" />1 &nbsp
					<form:radiobutton  path="question2" value="2" required="true" />2 &nbsp 
					<form:radiobutton  path="question2" value="3" required="true" />3 &nbsp 
					<form:radiobutton  path="question2" value="4" required="true" />4 &nbsp 
					<form:radiobutton  path="question2" value="5" required="true" />5 &nbsp 
					<form:radiobutton  path="question2" value="6" required="true" />6 &nbsp 
					<form:radiobutton  path="question2" value="7" required="true" />7 &nbsp 
					<form:radiobutton  path="question2" value="8" required="true" />8 &nbsp 
					<form:radiobutton  path="question2" value="9" required="true" />9 &nbsp 
					<form:radiobutton  path="question2" value="10" required="true" />10 &nbsp 					
					</li>
					<br>
				
			<br/><br/><br/><br/>	
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Add Form" class="btnSave"></span>
					<a href="BASG_table.it?id=${patient.getId() }"><span class="btn"><input type="button"
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