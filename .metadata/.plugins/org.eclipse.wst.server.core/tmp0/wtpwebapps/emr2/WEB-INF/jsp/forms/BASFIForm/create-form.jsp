<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Create BASFI Form</title>
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
				<p class="titles"> The Bath Ankylosing Spondylitis Functional Index (BASFI)</p><br>	
				<br/><br/>
					<li><h3>HOW DO YOU FIND IN A SCALE FROM "EASY" (0) TO "IMPOSSIBLE" (10):</h3>
					</li>
					<br><br/>
					<form:form action="create_BASFI_form.it?id=${patient.getId() }" method="post" commandName="form">
					<li>1. Putting on your socks or tights without help or aids (e.g. sock aid)?<br>
							<form:radiobutton path="question1" value="0" required="true" />0 &nbsp 
							<form:radiobutton path="question1" value="1" required="true" />1 &nbsp
							<form:radiobutton path="question1" value="2" required="true" />2 &nbsp 
							<form:radiobutton path="question1" value="3" required="true" />3 &nbsp 
							<form:radiobutton path="question1" value="4" required="true" />4 &nbsp 
							<form:radiobutton path="question1" value="5" required="true" />5 &nbsp 
							<form:radiobutton path="question1" value="6" required="true" />6 &nbsp 
							<form:radiobutton path="question1" value="7" required="true" />7 &nbsp 
							<form:radiobutton path="question1" value="8" required="true" />8 &nbsp 
							<form:radiobutton path="question1" value="9" required="true" />9 &nbsp 
							<form:radiobutton path="question1" value="10" required="true" />10 &nbsp
							</li>
							<br>
							<li>2. Bending forward from the waist to pick up a pen from the floor without an aid?<br>
							<form:radiobutton path="question2" value="0" required="true" />0 &nbsp 
							<form:radiobutton path="question2" value="1" required="true" />1 &nbsp
							<form:radiobutton path="question2" value="2" required="true" />2 &nbsp 
							<form:radiobutton path="question2" value="3" required="true" />3 &nbsp 
							<form:radiobutton path="question2" value="4" required="true" />4 &nbsp 
							<form:radiobutton path="question2" value="5" required="true" />5 &nbsp 
							<form:radiobutton path="question2" value="6" required="true" />6 &nbsp 
							<form:radiobutton path="question2" value="7" required="true" />7 &nbsp 
							<form:radiobutton path="question2" value="8" required="true" />8 &nbsp 
							<form:radiobutton path="question2" value="9" required="true" />9 &nbsp 
							<form:radiobutton path="question2" value="10" required="true" />10 &nbsp
							</li/>
							<br>
							<li>3. Reaching up to a high shelf without help or aids (e.g. Helping Hand)?<br>
							<form:radiobutton path="question3" value="0" required="true" />0 &nbsp 
							<form:radiobutton path="question3" value="1" required="true" />1 &nbsp
							<form:radiobutton path="question3" value="2" required="true" />2 &nbsp 
							<form:radiobutton path="question3" value="3" required="true" />3 &nbsp 
							<form:radiobutton path="question3" value="4" required="true" />4 &nbsp 
							<form:radiobutton path="question3" value="5" required="true" />5 &nbsp 
							<form:radiobutton path="question3" value="6" required="true" />6 &nbsp 
							<form:radiobutton path="question3" value="7" required="true" />7 &nbsp 
							<form:radiobutton path="question3" value="8" required="true" />8 &nbsp 
							<form:radiobutton path="question3" value="9" required="true" />9 &nbsp 
							<form:radiobutton path="question3" value="10" required="true" />10 &nbsp
							</li>
							<br>
							<li>4. Getting out of an arm-less dining chair without using your hands or any help?<br>
							<form:radiobutton path="question4" value="0" required="true" />0 &nbsp 
							<form:radiobutton path="question4" value="1" required="true" />1 &nbsp
							<form:radiobutton path="question4" value="2" required="true" />2 &nbsp 
							<form:radiobutton path="question4" value="3" required="true" />3 &nbsp 
							<form:radiobutton path="question4" value="4" required="true" />4 &nbsp 
							<form:radiobutton path="question4" value="5" required="true" />5 &nbsp 
							<form:radiobutton path="question4" value="6" required="true" />6 &nbsp 
							<form:radiobutton path="question4" value="7" required="true" />7 &nbsp 
							<form:radiobutton path="question4" value="8" required="true" />8 &nbsp 
							<form:radiobutton path="question4" value="9" required="true" />9 &nbsp 
							<form:radiobutton path="question4" value="10" required="true" />10 &nbsp
							</li>
							<br>
							<li>5. Getting up of the floor - without help - from lying on your back?<br>
							<form:radiobutton path="question5" value="0" required="true" />0 &nbsp 
							<form:radiobutton path="question5" value="1" required="true" />1 &nbsp
							<form:radiobutton path="question5" value="2" required="true" />2 &nbsp 
							<form:radiobutton path="question5" value="3" required="true" />3 &nbsp 
							<form:radiobutton path="question5" value="4" required="true" />4 &nbsp 
							<form:radiobutton path="question5" value="5" required="true" />5 &nbsp 
							<form:radiobutton path="question5" value="6" required="true" />6 &nbsp 
							<form:radiobutton path="question5" value="7" required="true" />7 &nbsp 
							<form:radiobutton path="question5" value="8" required="true" />8 &nbsp 
							<form:radiobutton path="question5" value="9" required="true" />9 &nbsp 
							<form:radiobutton path="question5" value="10" required="true" />10 &nbsp
							</li>
							<br>
							<li>6. Standing unsupported for ten minutes without discomfort?<br>
							<form:radiobutton path="question6" value="0" required="true" />0 &nbsp 
							<form:radiobutton path="question6" value="1" required="true" />1 &nbsp
							<form:radiobutton path="question6" value="2" required="true" />2 &nbsp 
							<form:radiobutton path="question6" value="3" required="true" />3 &nbsp 
							<form:radiobutton path="question6" value="4" required="true" />4 &nbsp 
							<form:radiobutton path="question6" value="5" required="true" />5 &nbsp 
							<form:radiobutton path="question6" value="6" required="true" />6 &nbsp 
							<form:radiobutton path="question6" value="7" required="true" />7 &nbsp 
							<form:radiobutton path="question6" value="8" required="true" />8 &nbsp 
							<form:radiobutton path="question6" value="9" required="true" />9 &nbsp 
							<form:radiobutton path="question6" value="10" required="true" />10 &nbsp
							</li>
							<br>
							<li>7. Bending forward from the waist to pick up a pen from the floor without an aid?<br>
							<form:radiobutton path="question7" value="0" required="true" />0 &nbsp 
							<form:radiobutton path="question7" value="1" required="true" />1 &nbsp
							<form:radiobutton path="question7" value="2" required="true" />2 &nbsp 
							<form:radiobutton path="question7" value="3" required="true" />3 &nbsp 
							<form:radiobutton path="question7" value="4" required="true" />4 &nbsp 
							<form:radiobutton path="question7" value="5" required="true" />5 &nbsp 
							<form:radiobutton path="question7" value="6" required="true" />6 &nbsp 
							<form:radiobutton path="question7" value="7" required="true" />7 &nbsp 
							<form:radiobutton path="question7" value="8" required="true" />8 &nbsp 
							<form:radiobutton path="question7" value="9" required="true" />9 &nbsp 
							<form:radiobutton path="question7" value="10" required="true" />10 &nbsp
							</li>
							<br>
							<li>8. Looking over your shoulder without turning your body?<br>
							<form:radiobutton path="question8" value="0" required="true" />0 &nbsp 
							<form:radiobutton path="question8" value="1" required="true" />1 &nbsp
							<form:radiobutton path="question8" value="2" required="true" />2 &nbsp 
							<form:radiobutton path="question8" value="3" required="true" />3 &nbsp 
							<form:radiobutton path="question8" value="4" required="true" />4 &nbsp 
							<form:radiobutton path="question8" value="5" required="true" />5 &nbsp 
							<form:radiobutton path="question8" value="6" required="true" />6 &nbsp 
							<form:radiobutton path="question8" value="7" required="true" />7 &nbsp 
							<form:radiobutton path="question8" value="8" required="true" />8 &nbsp 
							<form:radiobutton path="question8" value="9" required="true" />9 &nbsp 
							<form:radiobutton path="question8" value="10" required="true" />10 &nbsp
							</li>
							<br>
							<li>9. Doing physically demanding activities (e.g. physio exercises, gardening, sport)?<br>
							<form:radiobutton path="question9" value="0" required="true" />0 &nbsp 
							<form:radiobutton path="question9" value="1" required="true" />1 &nbsp
							<form:radiobutton path="question9" value="2" required="true" />2 &nbsp 
							<form:radiobutton path="question9" value="3" required="true" />3 &nbsp 
							<form:radiobutton path="question9" value="4" required="true" />4 &nbsp 
							<form:radiobutton path="question9" value="5" required="true" />5 &nbsp 
							<form:radiobutton path="question9" value="6" required="true" />6 &nbsp 
							<form:radiobutton path="question9" value="7" required="true" />7 &nbsp 
							<form:radiobutton path="question9" value="8" required="true" />8 &nbsp 
							<form:radiobutton path="question9" value="9" required="true" />9 &nbsp 
							<form:radiobutton path="question9" value="10" required="true" />10 &nbsp
							</li>
							<br>
							<li>10. Doing a full day's activities at home or at work?<br>
							<form:radiobutton path="question10" value="0" required="true" />0 &nbsp 
							<form:radiobutton path="question10" value="1" required="true" />1 &nbsp
							<form:radiobutton path="question10" value="2" required="true" />2 &nbsp 
							<form:radiobutton path="question10" value="3" required="true" />3 &nbsp 
							<form:radiobutton path="question10" value="4" required="true" />4 &nbsp 
							<form:radiobutton path="question10" value="5" required="true" />5 &nbsp 
							<form:radiobutton path="question10" value="6" required="true" />6 &nbsp 
							<form:radiobutton path="question10" value="7" required="true" />7 &nbsp 
							<form:radiobutton path="question10" value="8" required="true" />8 &nbsp 
							<form:radiobutton path="question10" value="9" required="true" />9 &nbsp 
							<form:radiobutton path="question10" value="10" required="true" />10 &nbsp
							</li>
					<br>
			
			<br><br><br><br>
			
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Create Form" class="btnSave"></span>
					<a href="BASFI_table.it?id=${patient.getId() }"><span class="btn"><input type="button"
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