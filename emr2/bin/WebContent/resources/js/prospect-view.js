$(document)
		.ready(
				function() {
					var $dialog = $('#actionDialog');
					$dialog.dialog({
						autoOpen : false,
						modal : true,
						resizable : false,
						open: function(event, ui) {
						    $(this).parent().css('position', 'fixed');
						}
					});

					$("input[class='btnCancel']")
							.click(
									function() {
										showChooseItemDialog($dialog,
												"#formCancel",
												"Are you sure you want to cancel editing this prospect?");
										return false;
									});

					$("input[class='btnDel']")
							.click(
									function() {
										showChooseItemDialog($dialog,
												"#formDel",
												"Are you sure you want to delete this item?");
										return false;
									});
				});

function showChooseItemDialog($dialog, $formId, $message) {
	$dialog.html($message).dialog({
		buttons : {
			"Confirm" : function() {
				$($formId).submit();
			},
			Cancel : function() {
				$(this).dialog("close");
			}
		}
	}).dialog('open');
}