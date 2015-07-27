<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Add Disease</title>
	<meta charset="utf-8">


</head>

<body>

<div id="wrap">
<jsp:include page="../headers/admin-header.jsp">
	<jsp:param name="title" value="Add Disease" />
	<jsp:param name="selected" value="diseases" />
</jsp:include>

<div class="pageCtrl">

<ul class="ctrlBtn listSpace">
	<li><span class="btn"><input type="button" value="Edit" class="btnEdit"></span></li>
	<li><span class="btn"><input type="button" value="Delete" class="btnDel"></span></li>
</ul>
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">	
	<div class="wrapper">
		<form:form class="crmForm" commandName="disease" method="post" action="add_disease.it?id=${adminUser.getId() }">
        <section class="settingBody clrfix">		
			<div class = "left">
				<jsp:include page="../headers/admin-left.jsp" />
			</div>
			
			<div class="right">			
			<h4>New Disease</h4>
			<form>
			<ul>
				<li><label>Disease:</label><form:input type="text" path="name" required="true"/></li><br>

		<li><div class="tableHeadertransdis clrfix">

			<table border="1" class="navigation">
				<tr>
					<td class="pro" style="width:1px">&nbsp</a></td>
					<td class="pro" style="width:2px; padding-left:1px; padding-right:1px; text-align:center;">Stage</a></td>
					<td class="ind" style="width:150px; text-align:center">Description</a></td>
				</tr>
			</table>
		</div>
    <table id="dataTable" width="750px" border="1">
	        <tr>
            <td><input type="checkbox" name="chk"/></td>
            <td>1</td>
            <td><form:input path="stage1Desc" /></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="chk"/></td>
            <td>2</td>
            <td><form:input path="stage2Desc" /></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="chk"/></td>
            <td>3</td>
            <td><form:input path="stage3Desc" /></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="chk"/></td>
            <td>4</td>
            <td><form:input path="stage4Desc" /></td>
        </tr>

    </table>
	<ul>
		<li style="padding-left:290px">
			<span class="btn"><input type="button" class="btnNew" value="Add Stage" onclick="addRow('dataTable')" /></span>	
			<span class="btn"><input type="button" class="btnDel" value="Delete Stage" onclick="deleteRow('dataTable')" /></span>
		</li>
	</ul>
</li>


				<br><li><label>Type:</label>
					<form:select path="type" required="true">
						<option hidden="None">None</option>
						<option value="Infectious">Infectious</option>
						<option value="Contagious">Contagious</option>
						<option value="Communicable">Communicable</option>
						<option value="Non-communicable">Non-communicable</option>
						<option value="Foodborne">Foodborne</option>
						<option value="Airborne">Airborne</option>
						<option value="Lifestyle Disease">Lifestyle Disease</option>
						<option value="Organic Disease">Organic Disease</option>
						<option value="Mental Disorder">Mental Disorder</option>
					</form:select></li>
			</form>
			</ul>
				<label>Description:</label><form:textarea required="true" path="description" rows="4" cols="50" style="width:500px; height:100px;" />
			</div>
								<section>
									<ul class="btnForm">
									<font style="padding-left:360px"></font>
										<span class="btn"><input type="submit"
												value="Add Disease" class="btnSave"></span>
										<a href="view_diseases.it"><span class="btn"><input type="button"
												value="Cancel" class="btnCancel"></span></a>
										<font style="padding-left:360px"></font>	
										<span class="btn"><input type="button"
											value="Back to Top" class="btnTop"></span>
									</ul>
								</section>	
		</section>	
		</form:form>	
		</div>	
</div>
	
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer> 	
</body>
</html>