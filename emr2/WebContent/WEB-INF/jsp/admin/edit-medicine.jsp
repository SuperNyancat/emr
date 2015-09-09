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
	<jsp:param name="title" value="Update Medicine" />
	<jsp:param name="selected" value="medicines" />
</jsp:include>


<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper">
	

	

	<form:form method="post" class="crmForm" commandName="medicine" action="update_medicine.it?id=${medicine.getId() }">
    <div class="div-left">
        <p class="cr_doc">CREATING NEW MEDICINE</p>
            <div class="form-inline">

        <label for="text" class="sr-only">Generic Name</label>
        <form:input type="text" path="genericName" class="form-control" value="${medicine.getGenericName() }" required="true"/>
        <br><br>
        <label for="text" class="sr-only">Uses</label>
        <form:textarea  rows="4" cols="50" type="text" path="uses"  class="form-control" value="${medicine.getUses() }" required="true"/>

</div>
</div>
    <div class="div-right_med">
        <div class="form-inline">
                <label for="text" class="sr-only">Brand Name</label>
        <form:input type="text" path="brandName" class="form-control" value="${medicine.getBrandName() }" required="true"/>
        <br><br>
        <label for="text" class="sr-only">Side Effects</label>
        <form:textarea  rows="4" cols="50" type="text" path="sideEffects" class="form-control" value="${medicine.getSideEffects() }" required="true"/>
        <br>
        </div>
    </div>
    <div class="div_button_med">
          <table>
            <tr>
            <td class="col-md-8" align="center"><input type="submit" value = "Edit Medicine"class="btn btn-default-create"/></td>
            <td class="col-md-8" align="center"><a href="view_medicines.it"><input type="button" value="Cancel" class="btn btn-default-cancel" onClick="viewPotentialsList()"/></a></td>
            </tr>
            </table>
        </div>
	</form:form>
    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
			
			
			
			</div>
		</section>			
			
	
		

	</form>

	
	
	
</div>
	

</div>

</body>
</html>