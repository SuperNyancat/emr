<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<!doctype html>
<html lang="en">
<head>
	<title>Upload Profile Picture</title>
	<meta charset="utf-8">

</head>

<body>

<div id="wrap">
<c:choose>
	<c:when test="${nurse != null && adminUser == null}">
		<jsp:include page="../headers/nurse-header.jsp">
			<jsp:param name="title" value="Doctor Home" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:when>
	<c:when test="${adminUser == null && nurse == null }">
		<jsp:include page="../headers/doctor-header.jsp">
			<jsp:param name="title" value="Doctor Home" />
			<jsp:param name="selected" value="patients" />
		</jsp:include>
	</c:when>
	<c:when test="${doctor != null }">
		<jsp:include page="../headers/admin-header.jsp">
			<jsp:param name="title" value="Doctor Profile" />
			<jsp:param name="selected" value="doctors" />
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../headers/admin-header.jsp">
			<jsp:param name="title" value="View Nurses" />
			<jsp:param name="selected" value="nurses" />
		</jsp:include>
	</c:otherwise>
</c:choose>

<div class="pageCtrl">
	
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	<div class="wrapper">	
	<div class="tabs">
		<c:if test="${adminUser == null }">
			<jsp:include page="../headers/patient-header.jsp">
				<jsp:param name="selected" value="profile" />
			</jsp:include>
		</c:if>
		<div class="tab-content">
				<section class="settingBody clrfix">		
				<div class = "left">
				<c:choose>
					<c:when test="${adminUser == null }">
						<jsp:include page="../headers/patient-left.jsp" />
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${doctor != null }">
								<h4 class="name">${doctor.getPersonInfo().getFirstName() }  ${doctor.getPersonInfo().getLastName()}</h4>
								<p>${ doctor.getPersonInfo().getEmail() }</p>
								<c:choose>
									<c:when test="${doctor.getRelativePath() == null || doctor.getRelativePath().equalsIgnoreCase('null')}">
										<img src="resources/images/img_user.jpg" alt="">
									</c:when>
									<c:otherwise>
										<img src="${doctor.getRelativePath() }" alt="${doctor.getPersonInfo().getFirstName()}'s profile picture" />
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<h4 class="name">${nurse.getPersonInfo().getFirstName() }  ${nurse.getPersonInfo().getLastName()}</h4>
								<p>${ nurse.getPersonInfo().getEmail() }</p>
								<c:choose>
									<c:when test="${nurse.getRelativePath() == null || nurse.getRelativePath().equalsIgnoreCase('null')}">
										<img src="resources/images/img_user.jpg" alt="">
									</c:when>
									<c:otherwise>
										<img src="${nurse.getRelativePath() }" alt="${nurse.getPersonInfo().getFirstName()}'s profile picture" />
									</c:otherwise>
								</c:choose>
							</c:otherwise>						
						</c:choose>
					</c:otherwise>					
				</c:choose>
					
				</div>
	
				<div class="right" align="center">
					<p class="titles">Upload Profile Picture</p><br>
					<div id="upload"><br><br><br>
					<image id="photo" src="resources/images/img_user.jpg"/><br>
					<c:choose>
						<c:when test="${patient != null }">
							<form:form action="patient_dp.it?id=${patient.id }&key=p" method="post" commandName="form" enctype="multipart/form-data">
								Select File: <input type="file" name="images[0]" id="image" onSubmit="return Validate();"/>
								<a href=""><span class="btn"><input type="submit" value="Upload" class="btnNew"></span></a>						
							</form:form>
						</c:when>
						<c:when test="${nurse == null && patient == null}">
							<form:form action="upload_photo.it?id=${doctor.id }&key=d" method="post" commandName="form" enctype="multipart/form-data">
								Select File: <input type="file" name="images[0]" id="image" onSubmit="return Validate();"/>
								<a href=""><span class="btn"><input type="submit" value="Upload" class="btnNew"></span></a>						
							</form:form>
						</c:when>
						<c:otherwise>
							<form:form action="upload_photo.it?id=${nurse.id }&key=n" method="post" commandName="form" enctype="multipart/form-data">
								Select File: <input type="file" name="images[0]" id="image" onSubmit="return Validate();"/>
								<a href=""><span class="btn"><input type="submit" value="Upload" class="btnNew"></span></a>						
							</form:form>
						</c:otherwise>
					</c:choose>
					
						
					</div>
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