
function myFunction() {
    var x;
    if (confirm("Are you sure you want to delete?") == true) {
        x = "";
    } else {
        x = "";
    }
    document.getElementById("demo").innerHTML = x;
}

function myFunction1() {
    var x;
    if (confirm("Are you sure you want to disable this patient? \n\n Disabled patients can be enabled in the Reports tab.") == true) {
        x = "";
    } else {
        x = "";
    }
    document.getElementById("demo").innerHTML = x;
}

function selectDoctor(theForm) { 
if (theForm.doctor.value=='0') { 
alert("Please select a doctor"); 
theForm.doctor.focus(); 
return false; 
} 
return true; 
}  



