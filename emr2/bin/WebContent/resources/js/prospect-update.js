$(document).ready(function() {
  var $dialog = $('#actionDialog');
  $dialog.dialog({ autoOpen : false, modal : true, resizable : false,
		open: function(event, ui) {
		    $(this).parent().css('position', 'fixed');
		} });
  
  $("input[class='btnCancel']").click(function() { 
	  $dialog.html("Are you sure you want to cancel creating this prospect?").dialog({
      buttons : { 
        "Confirm" : function() { window.location.replace("../prospect/list"); },
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