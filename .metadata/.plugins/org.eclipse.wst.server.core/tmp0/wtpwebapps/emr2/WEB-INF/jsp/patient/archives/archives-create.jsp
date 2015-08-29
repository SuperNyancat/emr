<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<!doctype html>
<html lang="en">
<head>
	<title>Archives</title>
	<meta charset="utf-8">	
	<script>
		function Validate()
		  {
			 var image =document.getElementById("image").value;
			 if(image!=''){
				  var checkimg = image.toLowerCase();
				  if (!checkimg.match(/(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/)){
					  alert("Please enter  Image  File Extensions .jpg,.png,.jpeg");
					  document.getElementById("image").focus();
					  return false;
				    }
				 }
			 return true;
		 }			
	</script>
</head>

<body>

<div id="wrap">
<jsp:include page="../../headers/doctor-header.jsp">
	<jsp:param name="title" value="Doctor Home" />
	<jsp:param name="selected" value="patients" />
</jsp:include>

<div class="pageCtrl">
<c:if test="${errorMessage != null }">
	<div class="error">${errorMessage}</div>
	<c:remove var="errorMessage" scope="session" />
</c:if><br>
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	<div class="wrapper">	
		<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="archives" />
			</jsp:include>
		
			<div class="tab-content">
				<div id="History" class="tab active">           
					<section class="settingBody clrfix">		
						<div class = "left">
							<jsp:include page="../../headers/patient-left.jsp" />
						</div>
			<p><font color="red">NOTE: The archives feature is currently non-functional online, but is fully operational 
		 on the localhost. We are currently addressing this issue.</font></p>
			<font color="red" size="3px">${errorMessage}</font>
			<c:remove var="errorMessage" scope="session" />
						<div class="right" align="center">
							<p class="titles">Upload Photo</p><br>
							<div id="upload"><br><br><br>
							<image id="photo" src="resources/images/upload.png"/><br>
						<form:form action="create_archives.it?id=${patient.getId() }" method="post" commandName="form" enctype="multipart/form-data">
						<c:forEach begin="0" end="4" varStatus="i">
							Select File: <input type="file" name="images[${i.index }]" id="image" onSubmit="return Validate();"/>
							<!-- Select File: <input type="file" name="images[1]" id="image"/>
							Select File: <input type="file" name="images[2]" id="image"/>
							Select File: <input type="file" name="images[3]" id="image"/>c:forEach begin="0" end="4" varStatus="i" -->
					</c:forEach>
							<a href=""><span class="btn"><input type="submit" value="Upload" class="btnNew"></span></a>						
						</form:form></div>
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