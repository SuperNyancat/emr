
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

</script>

<body>
	<div>
		<jsp:include page="../headers/admin-header.jsp">
			<jsp:param name="title" value="Create Nurse Account" />
			<jsp:param name="selected" value="nurses" />
		</jsp:include>
	</div>
	
    <!-- Page Content -->
  <form:form class="crmForm" method="post" commandName="nurse" action="create_nurse.it?adminId=${adminUser.getId() }" >
    <div class="div-left">
        <p class="cr_doc">NURSE INFORMATION</p>
        <div class="form-group">
            <div class="form-inline">

        <label for="text" class="sr-only">License Number</label>
        <form:input path="licenseNumber" class="form-control" placeholder="License Number"/>
        <br><br>
        <label for="text" class="sr-only">First Name</label>
        <form:input type="text" path="personInfo.firstName" required="true" class="form-control" placeholder="First Name"/>
        <label for="text" class="sr-only">Last Name</label>
        <form:input type="text" path="personInfo.lastName" class="form-control" placeholder="Last Name" required="true"/>
            <br><br>
            <label for="text" class="sr-only">Occupation</label>
            <form:input path="personInfo.occupation" class="form-control" placeholder="Occupation"/>
            <br><br>
            <div class="form-group">
        <div class="date">
            <div class="input-group input-append date" id="datePicker">
                <input type="text" id="inputField" required class="form-control" name="personInfo.dateOfBirth" placeholder="Birthday"/>
                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
        </div>
    </div>
            <div class="radio-inline">
                <label class="radio-inline"><form:radiobutton path="personInfo.sex" value="male"/>Male</label>
                <label class="radio-inline"><form:radiobutton path="personInfo.sex" value="female"/>Female</label>
            </div>
            <br><br>
            <label for="text" class="sr-only">Phone Number</label>
            <form:input path="personInfo.contacts[0].phoneNumber" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off" class="form-control" placeholder="Phone Number" />
            <label for="text" class="sr-only">Mobile Number</label>
            <form:input path="personInfo.contacts[0].mobileNumber" type="text" required="true" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off" class="form-control" placeholder="Mobile Number" />
            <br><br>
            <label for="inputEmail" class="sr-only">Email Address</label>
            <form:input path="personInfo.email" type="text" required="true" pattern="(^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,}))*" autocomplete="off" class="form-control" placeholder="Email Address" />
            <br><br>
            <p class="cr_doc">HOSPITAL DETAILS</p>
                <label for="text" class="sr-only">Hospital Name</label>
                <form:input path="personInfo.companyName" value="USTH Joint and Bone Center" class="form-control" placeholder="Hospital Name"/>
                <br><br>
                <label for="text" class="sr-only">Employee ID</label>
                <form:input path="employeeId" type="text" required="true" class="form-control" placeholder="Employee ID"/>
                <br><br>
                <label for="text" class="sr-only">Phone Number</label>
                <form:input path="personInfo.contacts[1].phoneNumber" value="7313001" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off" class="form-control" placeholder="Phone Number" />
                <label for="text" class="sr-only">Work Mobile No.</label>
                <form:input path="personInfo.contacts[1].mobileNumber" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off" class="form-control" placeholder="Work Mobile No." />
                <br><br>
                <label for="text" class="sr-only">Address</label>
                <form:input path="personInfo.addresses[1].address" value = "Espanya Blvd." class="form-control" placeholder="Address" />
                <br><br>
                <label for="text" class="sr-only">City</label>
                <form:input path="personInfo.addresses[1].city" value="Manila" class="form-control" placeholder="City" />
                <label for="text" class="sr-only">Province</label>
                <form:input path="personInfo.addresses[1].province" value="Manila" class="form-control" placeholder="Province" />
                <br><br>
                <label for="text" class="sr-only">Zip Code</label>
                <form:input path="personInfo.addresses[1].zipCode" value="1015" class="form-control" placeholder="Zip Code" />
        </div>
    </div>

    </div>
    <div class="div-right">
        <div class="form-inline">
     <p class="cr_doc">ADDRESS</p>
                <label for="text" class="sr-only">Address</label>
                <form:input path="personInfo.addresses[0].address" class="form-control" placeholder="Address" />
                <br><br>
                <label for="text" class="sr-only">City</label>
                <form:input path="personInfo.addresses[0].city" class="form-control" placeholder="City" />
                <label for="text" class="sr-only">Province</label>
                <form:input path="personInfo.addresses[0].province" class="form-control" placeholder="Province" />
                <br><br>
                <label for="text" class="sr-only">Zip Code</label>
                <form:input path="personInfo.addresses[0].zipCode" class="form-control" placeholder="Zip Code" />
                <br><br>
                <p class="cr_doc">ACCOUNT DETAILS</p>
                <label for="text" class="sr-only">Username</label>
                <form:input path="user.username" required="true" class="form-control" placeholder="Username" />
                <br><br>
                <label for="password" class="sr-only">Password</label>
                <form:password path="user.password" min="8" required="true" id="txtNewPassword" class="form-control" placeholder="Password" />
                <br><br>
                <label for="password" class="sr-only">Confirm Password</label>
                <input type="password" minlength="8" required="true" id="txtConfirmPassword" onChange="isPasswordMatch();" class="form-control" placeholder="Confirm Password" />
                <br><br>
                <p class="sec_ques">In case you forget your password, you will be asked to answer
                    the security question you will provide below.</p>
                     <label for="text" class="sr-only">Security Question</label>
                <form:input path="personInfo.securityQuestion" required="true" class="form-control" placeholder="Security Question" />
                <br><br>
                 <label for="text" class="sr-only">Answer</label>
                <form:input path="personInfo.securityAnswer" required="true" class="form-control" placeholder="Answer" />
                <br><br>
        </div>
    </div>
    <div class="div_button">
        <table>
            <tr>
            <td class="col-md-8" align="center"><input type="submit" value = "Create Account"class="btn btn-default-create"/></td>
            <td class="col-md-8" align="center"><a href="view_doctors.it"><input type="button" value="Cancel" class="btn btn-default-cancel" onClick="viewPotentialsList()"/></a></td>
            </tr>
            </table>
        </div>
</form:form>
    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
<script>
$(document).ready(function() {
    $('#datePicker')
        .datepicker({
            format: 'yyyy-mm-dd'
        })
        .on('changeDate', function(e) {
            // Revalidate the date field
            $('#eventForm').formValidation('revalidateField', 'date');
        });

    $('#eventForm').formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {
                        message: 'The name is required'
                    }
                }
            },
            date: {
                validators: {
                    notEmpty: {
                        message: 'The date is required'
                    },
                    date: {
                        format: 'YYYYY-MM-DD',
                        message: 'The date is not a valid'
                    }
                }
            }
        }
    });
});
</script>

</body>

</html>