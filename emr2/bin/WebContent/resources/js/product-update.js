function accounts_list() {
	window.location.replace("list");
}

function limit_text(limitField, limitNum) {
	if (limitField.value.length > limitNum) {
		limitField.value = limitField.value.substring(0, limitNum);
	} else {
		limitCount.value = limitNum - limitField.value.length;
	}
}

$(document).ready(function() {
	  var $dialog = $('#dialogBox');
	  $dialog.dialog({ autoOpen : false, modal : true, resizable : false });
	  
	  $("input[class='btnCancel']").click(function() { 
		  $dialog.html("Are you sure you want to cancel editing this product?").dialog({
	      buttons : { 
	        "Confirm" : function() { window.location.replace("../product/list"); },
	        Cancel : function() { $(this).dialog("close"); }
	      }
	  	}).dialog('open');
	  });
		  
	  $("input[class='btnDel']").click(function() {
		  $dialog.html("Are you sure you want to delete this item?").dialog({
			  buttons : {
				  "Confirm" : function() { $("#formDel").submit(); },
				  Cancel : function() { $(this).dialog("close"); }
				}
		  }).dialog('open');
		  return false;
		});
	  });