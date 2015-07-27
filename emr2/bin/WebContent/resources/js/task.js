var inputElement;
var hiddenElement;

function popupSearchContact(select, input, hidden){
	inputElement = input;
	hiddenElement = hidden;
	
	type = $("#relatedType option:selected").val();
	var id;
	if(type === "account")  id = $("#relatedAccountId").val();
	else if(type === "potential")  id = $("#relatedPotentialId").val();
	$("#contactId").val(null);
	
	window.open(select.attr('addr')+"?id="+id+"&type="+type, "_blank", "width=500, height=500");
}

function popupSearchRelatedTo(select, input, hidden){
	$("#contactNameText").val("");
	$("#contactId").val(null);
	
	inputElement = input;
	hiddenElement = hidden;
	
	$("#relatedAccountId").val(null);
	$("#relatedPotentialId").val(null);
	
	window.open(select.attr('addr'), "_blank", "width=500, height=500");
}

function changeText(search){
	console.log(search);
	console.log(search.id);
	console.log(hiddenElement);
	inputElement.val(search.name);
	hiddenElement.val(search.id);
}

function setupRecurrPanel(){
	if($("#recurr_checkbox").prop("checked")) $("#recurr_div").show();
	else $("#recurr_div").hide();
}

$(document).ready(function(){
	setupRecurrPanel();
	
	$("#recurr_checkbox").click(function(){
		$("#recurr_div").slideToggle(500);
	});
	
	$("#startDatepicker").change(function(){
		$("#endDatepicker").datepicker("option", "minDate", new Date($("#startDatepicker").val()));
		$("#endDatepicker").datepicker("refresh");
	});
	
	$("#relatedType").change(function(){
		$("#relatedText").val("");
		$("#contactNameText").val("");
		$("#relatedAccountId").val(null);
		$("#relatedPotentialId").val(null);
		$("#contactId").val(null);
	});
});
