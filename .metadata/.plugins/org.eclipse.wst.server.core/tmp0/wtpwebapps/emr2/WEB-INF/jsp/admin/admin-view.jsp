<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
			<jsp:param name="title" value="Admin Profile" />
			<jsp:param name="selected" value="home" />
		</jsp:include>


<div class="pageCtrl">
	<ul class="ctrlBtn listSpace">
		<li><span class="btn">
			<form:form commandName="adminUser" action="admin_edit.it" method="GET">
				<form:hidden path="id" value="${adminUser.id }" />
				<input type="submit" value="Edit" class="btnEdit" />
			</form:form>
		</span></li>
	</ul>
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper">
	
		<section class="settingBody clrfix">		
			<div class = "left">
				<h4 class="name">System Administrator</h4>
				<p>${adminUser.getUsername() }</p>
				<img src="resources/images/img_user.jpg" alt="profile picture">
			</div>
			<div class="right">
				<p class="titles">System Administrator</p>
				<br><br>
				<h4>Account Details</h4>				
				<form class="settingForm">
					<label>Username</label>:  <span>${ adminUser.getUsername() }</span> </br> 
				</form>
				
				<br><br>
				
			</div>
		</section>
		
            
        </div>

		
    </div>
	</div> 	
	

	
</div>
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>



</body>
</html>