<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>EMR - Pendragons</title>
	<meta charset="utf-8">
	
	<link rel="stylesheet" href="css/reset.css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="css/template.css">
	<link rel="stylesheet" href="css/forms.css">
	<link rel="stylesheet" href="css/form-popup.css">
	<link rel="stylesheet" href="css/template-table.css">
	<link rel="stylesheet" href="css/homepage.css">	
	<link rel="stylesheet" href="css/tabs.css">	
	<link rel="stylesheet" href="css/settings.css">	
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<![endif]-->
</head>

<body>

<div id="wrap">
<jsp:include page="../headers/admin-header.jsp">
	<jsp:param name="title" value="Update Disease" />
	<jsp:param name="selected" value="diseases" />
</jsp:include>


    <!-- Page Content -->
	<form:form class="crmForm" commandName="disease" method="post" action="add_disease.it?id=${adminUser.getId() }">
    <div id="page-wrapper">
    <div class="div-left_disease">
        <p class="cr_doc">CREATING NEW DISEASE</p>
            <div class="form-inline">

        <label for="text" class="sr-only">Disease Name</label>
        <form:input type="text" path="name" class="form-control" placeholder="Disease Name" required="true"/>
        <br><br>
        <table>
            <tr class="jumbotron_disease">
                <td class="col-md-8" align="center">Stage</td>
                <td class="col-md-8" align="center">Description</td>
            </tr>

            <tr class="jumbotron_disease_extension">
            <div class="checkbox-inline">
                <td class="col-md-3" align="center"><label class="checkbox-inline"><input type="checkbox" name="stage1">1</label></td>
                <td class="col-md-3" align="center"><label for="text" class="sr-only">Stage 1</label>
                <form:input path="stage1Desc" class="form-control" /></td>
            </div>
                </tr>

                <tr class="jumbotron_disease_extension">
                <div class="checkbox-inline">
                <td  class="col-md-3" align="center"><label class="checkbox-inline"><input type="checkbox" name="stage2">2</label></td>
                <td  class="col-md-3" align="center"><label for="text" class="sr-only">Stage 2</label>
                <form:input path="stage2Desc" class="form-control" /></td>
            </div>
                </tr>

                <tr class="jumbotron_disease_extension">
                <div class="checkbox-inline">
                <td class="col-md-3" align="center"><label class="checkbox-inline"><input type="checkbox" name="stage3">3</label></td>
                <td class="col-md-3" align="center"><label for="text" class="sr-only">Stage 3</label>
                <form:input path="stage3Desc" class="form-control" /></td>
            </div>
                </tr>

                <tr class="jumbotron_disease_extension">
                <div class="checkbox-inline">
                <td class="col-md-3" align="center"><label class="checkbox-inline"><input type="checkbox" name="stage4">4</label></td>
                <td class="col-md-3" align="center"><label for="text" class="sr-only">Stage 4</label>
                <form:input path="stage4Desc" class="form-control" /></td>
            </div>
                </tr>
            <tr class="jumbotron_disease_extension">
                <td class="col-md-3" align="center"><button type="button" class="btn btn-default-create">Add Stage</button></td>
                <td class="col-md-3" align="center"><button type="button" class="btn btn-default-create">Delete Stage</button></td>
            </tr>
        </table>

</div>
</div>
    <div class="div-right_disease">
        <div class="form-inline">
                <li><label for="text" class="sr-only">Type</label>
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
        <br><br>
        <label for="text" class="sr-only">Description</label>
        <form:textarea required="true" path="description" rows="4" cols="50" type="text"  class="form-control" placeholder="Description" />
        <br>
        </div>
    </div>
 </div>
 <div class="div_button_disease">
        <table>
            <tr>
             <td class="col-md-8" align="center"><input type="submit" value = "Add Disease"class="btn btn-default-create"/></td>
            <td class="col-md-8" align="center"><a href="view_medicines.it"><input type="button" value="Cancel" class="btn btn-default-cancel" onClick="viewPotentialsList()"/></a></td>
            </tr>
            </table>
        </div>
	</form:form>
    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>