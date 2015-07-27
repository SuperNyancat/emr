$(document)
		.ready(
				function() {
					var $id = $('input[name="contact-group"]:checkbox:checked').map(function () {
						  return this.value;
					}).get();
					
					$("input[name='contact-group']").click(function() {
						$id = $('input[name="contact-group"]:checkbox:checked').map(function () {
							  return this.value;
						}).get();
					});

					var $dialog = $('#actionDialog');
					$dialog.dialog({
						autoOpen : false,
						modal : true,
						resizable : false
					});

					$("input[class='btnCancel']").click(
							function() {
								showChooseItemDialog(
										$dialog,
										"../contact/list",
										"Are you sure you want to cancel creating this contact?",
										"");
							});


					$("input[class='btnDel']")
							.click(
									function() {
										if ($id.length > 0) {
											showChooseItemDialog(
													$dialog,
													"../contact/list",
													"Are you sure you want to delete these contacts?",
													"delete");
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

function showChooseItemDialog($dialog, $url, $message, $type) {
	$dialog.html($message).dialog({
		buttons : {
			"Confirm" : function() {
				if($type=="delete"){
					$('#contacts-form').attr('action', 'deleteselected');
					$('#contacts-form').submit();
				} else {
					window.location.href = $url;
				}
			},
			Cancel : function() {
				$(this).dialog("close");
			}
		}
	}).dialog('open');
}

function contact_create(){
	window.location.replace("create");
}
