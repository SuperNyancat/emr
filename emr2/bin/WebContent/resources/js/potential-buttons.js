// 
//	dependencies:
//		jquery.js
//		jquery-ui.css
//		jquery-ui.js
//		create container with id "actionDialog"
//
$(document).ready(
			function() {
				var $id = 0;
				$("input[name='potential-group']").click(function() {
					$id = $(this).attr("id");
				});
		
				var $dialog = $('#dialogBox');
				$dialog.dialog({
					autoOpen : false,
					modal : true,
					resizable : false
				});
				
			$("input[class='btnEdit']").click(
					function() {
						if ($id > 0) {
							window.location
									.href = "potential_update?id="
											+ $id;
						} else {
							showNoSelectedItemDialog($dialog);
						}
					});	
				
			$("input[class='btnDel']")
					.click(
							function() {
								if ($id > 0) {
									showChooseItemDialog(
											$dialog,
											"potential_delete?id=" + $id,
											"Are you sure you want to delete this item?");
								} else {
									showNoSelectedItemDialog($dialog);
								}
							});
	});


function showNoSelectedItemDialog($dialog) {
	$dialog.html("<p>Please select from the items first.</p>").dialog({
		buttons : {
			OK : function() {
				$(this).dialog("close");
			}
		}
	}).dialog('open');
}

function showChooseItemDialog($dialog, $url, $message) {
	$dialog.html($message).dialog({
		buttons : {
			"Confirm" : function() {
				window.location.href = $url;
			},
			Cancel : function() {
				$(this).dialog("close");
			}
		}
	}).dialog('open');
}

function potential_create_account(){
	window.location.replace("potential_create");
}
function potential_create_prospect(){
	window.location.replace("potential_create_prospect");
}