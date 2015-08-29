<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html lang="en">
<head>
<meta charset="utf-8">

	
</head>
	
<body>

<div id="wrap">
<jsp:include page="../headers/admin-header.jsp">
	<jsp:param name="title" value="Edit Administrator" />
	<jsp:param name="selected" value="home" />
</jsp:include>


<div class="content-wrap">
	
	<div class="wrapper">
		<div class="tabs">
			<div class="tab-content">
				<div id="History" class="tab active">
					
					<div class="right">
						<form:form class="crmForm" method="post" commandName="adminUser" action="admin_update.it" >
							<form:hidden path="id" value="${adminUser.id }"/>
							<form:hidden path="role.id" value="${adminUser.role.id }"/>
							<form:hidden path="role.roleType" value="${adminUser.role.roleType }"/>
							<section>
								<header>
									<h3>System Administrator</h3>
								</header>
							</section>
							<br><br>
							<section>
								<header><h3>Account Details</h3></header>
								<ul class="fields">
									<li><label>Username<span style="color:red;">*</span></label>:<form:input path="username" required="true" value="${adminUser.username }"/></li>
									<li><label>Password<span style="color:red;">*</span></label>:<form:password path="password" min="8" required="true" id="txtNewPassword" value="${adminUser.password}"  /></li>
									<li><label>Confirm Password<span style="color:red;">*</span></label>:<input type="password" minlength="8" required="true" id="txtConfirmPassword" onChange="isPasswordMatch();" /></li>
									<li><div id="divCheckPassword" style="color:red"></div></li>
								</ul>
							</section>
							<br><br>
													
							<section>
								<ul class="btnForm">
									<li>
										<span class="btn">
											<input type="submit" value="Save" class="btnSave">
										</span>
									</li>
					
									<li>
										<a href="admin_homepage.it">
											<span class="btn">
												<input type="button" value="Cancel" class="btnCancel">
											</span>
										</a>
									</li>							
								</ul>
								
								<div class="backontop">
									<span class="btn"><input type="button"
										value="Back to Top" class="btnTop"></span>
								</div>
							</section>
										
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end wrapper-->
</div>
<!-- end content-wrap-->
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

	<script src="resources/js/retypepwd.js"></script>

</div>
</body>
</html>