
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
			<jsp:param name="title" value="Update Nurse Account" />
			<jsp:param name="selected" value="nurse" />
		</jsp:include>
	</div>
	
    <!-- Page Content -->
  <form:form class="crmForm" method="post" commandName="nurse" action="update_nurse.it?id=${nurse.getId() }" >
		<form:hidden path="id" value="${nurse.id }"/>
							<form:hidden path="personInfo.revisionHistory.dateCreated" value="${nurse.personInfo.revisionHistory.dateCreated }"/>
							<form:hidden path="personInfo.revisionHistory.createdBy.id" value="${nurse.personInfo.revisionHistory.createdBy.id }"/>
						
							<c:if test="${nurse.personInfo.revisionHistory.dateDeleted != null }">
								<form:hidden path="personInfo.revisionHistory.dateDeleted" value="${nurse.personInfo.revisionHistory.dateDeleted  }"/>
								<form:hidden path="personInfo.revisionHistory.deletedBy.id" value="${nurse.personInfo.revisionHistory.deletedBy.id}"/>
							</c:if>
							<form:hidden path="personInfo.id" value="${nurse.getPersonInfo().getId()}" />
							<form:hidden path="user.id" value="${nurse.getUser().getId()}" />
							<form:hidden value="${ nurse.getPersonInfo().getContacts().get(0).getId() }" path="personInfo.contacts[0].id"/>
							<form:hidden value="${ nurse.getPersonInfo().getContacts().get(1).getId() }" path="personInfo.contacts[1].id"/>
							<form:hidden value="${ nurse.getPersonInfo().getAddresses().get(0).getId() }" path="personInfo.addresses[0].id"/>
							<form:hidden value="${ nurse.getPersonInfo().getAddresses().get(1).getId() }" path="personInfo.addresses[1].id"/>
							<form:hidden value="${nurse.getUser().getRole().getId() }" path="user.role.id"/>
							<form:hidden path="id" value="${nurse.getId()}"/>
    <div class="div-left">
        <p class="cr_doc">NURSE INFORMATION</p>
		<form:hidden path="id" value="${nurse.getId() }"/>
        <div class="form-group">
            <div class="form-inline">

        <label for="text" class="sr-only">License Number</label>
        <form:input path="licenseNumber" class="form-control" value="${nurse.licenseNumber }"/>
        <br><br>
        <label for="text" class="sr-only">First Name</label>
        <form:input type="text" path="personInfo.firstName" required="true" class="form-control" value="${nurse.getPersonInfo().getFirstName()}"/>
        <label for="text" class="sr-only">Last Name</label>
        <form:input type="text" path="personInfo.lastName" class="form-control" value="${nurse.getPersonInfo().getLastName()}" required="true"/>
            <br><br>
            <label for="text" class="sr-only">Occupation</label>
            <form:input path="personInfo.occupation" class="form-control" value="${nurse.getPersonInfo().getOccupation() }"/>
            <br><br>
            <div class="form-group">
        <div class="date">
            <div class="input-group input-append date" id="datePicker">
                <input type="text" id="inputField" required class="form-control" name="personInfo.dateOfBirth" value="${nurse.getPersonInfo().getDateOfBirth() }"/>
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
            <form:input path="personInfo.contacts[0].phoneNumber" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off" class="form-control" value="${ nurse.getPersonInfo().getContacts().get(0).getPhoneNumber() }" />
            <label for="text" class="sr-only">Mobile Number</label>
            <form:input path="personInfo.contacts[0].mobileNumber" type="text" required="true" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off" class="form-control" value="${ nurse.getPersonInfo().getContacts().get(0).getMobileNumber() }" />
            <br><br>
            <label for="inputEmail" class="sr-only">Email Address</label>
            <form:input path="personInfo.email" type="text" required="true" pattern="(^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,}))*" autocomplete="off" class="form-control" value="${ nurse.getPersonInfo().getEmail() }" />
            <br><br>
            <p class="cr_doc">HOSPITAL DETAILS</p>
                <label for="text" class="sr-only">Hospital Name</label>
                <form:input path="personInfo.companyName" value="${nurse.getPersonInfo().getCompanyName() }"  class="form-control" />
                <br><br>
                <label for="text" class="sr-only">Employee ID</label>
                <form:input path="employeeId" type="text" required="true" class="form-control" value="${ nurse.getEmployeeId() }"/>
                <br><br>
                <label for="text" class="sr-only">Phone Number</label>
                <form:input path="personInfo.contacts[1].phoneNumber" value="${ nurse.getPersonInfo().getContacts().get(1).getPhoneNumber()}" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off" class="form-control" />
                <label for="text" class="sr-only">Work Mobile No.</label>
                <form:input path="personInfo.contacts[1].mobileNumber" value="${ nurse.getPersonInfo().getContacts().get(1).getMobileNumber()}" pattern="(^\\+?[\\d]+(\\-?[\\d]+)*)*" autocomplete="off" class="form-control" />
                <br><br>
                <label for="text" class="sr-only">Address</label>
                <form:input path="personInfo.addresses[1].address" value="${ nurse.getPersonInfo().getAddresses().get(1).getAddress() }" class="form-control"  />
                <br><br>
                <label for="text" class="sr-only">City</label>
                <form:input path="personInfo.addresses[1].city" value="${ nurse.getPersonInfo().getAddresses().get(1).getCity() }" class="form-control"  />
                <label for="text" class="sr-only">Province</label>
                <form:input path="personInfo.addresses[1].province" value="${ nurse.getPersonInfo().getAddresses().get(1).getProvince() }" class="form-control"  />
                <br><br>
                <label for="text" class="sr-only">Zip Code</label>
                <form:input path="personInfo.addresses[1].zipCode" value="${ nurse.getPersonInfo().getAddresses().get(1).getZipCode() }" class="form-control"  />
        </div>
    </div>

    </div>
    <div class="div-right">
        <div class="form-inline">
     <p class="cr_doc">ADDRESS</p>
                <label for="text" class="sr-only">Address</label>
                <form:input path="personInfo.addresses[0].address" class="form-control" value="${ nurse.getPersonInfo().getAddresses().get(0).getAddress() }" />
                <br><br>
                <label for="text" class="sr-only">City</label>
                <form:input path="personInfo.addresses[0].city" class="form-control" value="${ nurse.getPersonInfo().getAddresses().get(0).getCity() }" />
                <label for="text" class="sr-only">Province</label>
                <form:input path="personInfo.addresses[0].province" class="form-control" value="${ nurse.getPersonInfo().getAddresses().get(0).getProvince() }" />
                <br><br>
                <label for="text" class="sr-only">Zip Code</label>
                <form:input path="personInfo.addresses[0].zipCode" class="form-control" value="${ nurse.getPersonInfo().getAddresses().get(0).getZipCode() }" />
                <br><br>
                <p class="cr_doc">ACCOUNT DETAILS</p>
                <label for="text" class="sr-only">Username</label>
                <form:input path="user.username" required="true" class="form-control" value="${ nurse.getUser().getUsername() }" />
                <br><br>
                <label for="password" class="sr-only">Password</label>
                <form:password path="user.password" min="8" required="true" id="txtNewPassword" class="form-control" value="${ nurse.getUser().getPassword() }" />
                <br><br>
                <label for="password" class="sr-only">Confirm Password</label>
                <input type="password" minlength="8" required="true" id="txtConfirmPassword" onChange="isPasswordMatch();" class="form-control" placeholder="Confirm Password" />
                <br><br>
                <p class="sec_ques">In case you forget your password, you will be asked to answer
                    the security question you will provide below.</p>
                     <label for="text" class="sr-only">Security Question</label>
                <form:input path="personInfo.securityQuestion" required="true" class="form-control" value="${nurse.getPersonInfo().getSecurityQuestion()}" />
                <br><br>
                 <label for="text" class="sr-only">Answer</label>
                <form:input path="personInfo.securityAnswer" required="true" class="form-control" value="${nurse.getPersonInfo().getSecurityAnswer()}" />
                <br><br>
        </div>
    </div>
    <div class="div_button">
        <table>
            <tr>
            <td class="col-md-8" align="center"><input type="submit" value = "Update Account"class="btn btn-default-create"/></td>
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