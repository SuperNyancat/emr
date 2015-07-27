$('#txtConfirmPassword').on('keyup', function () {
    var password = $("#txtNewPassword").val();
    var confirmPassword = $("#txtConfirmPassword").val();

    if (password != confirmPassword) $("#divCheckPassword").html("Passwords do not match!");
	else if (password == confirmPassword) $("#divCheckPassword").html("");
});