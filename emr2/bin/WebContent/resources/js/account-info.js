$(document)
		.ready(
				function() {
					var $dialog = $('#dialogBox');
					$dialog.dialog({
						autoOpen : false,
						modal : true,
						resizable : false
					});
					
					$("input[class='btnSaveNote']").click(
				 			function() {
				 				var $text = $('#noteText').val();
				 				var $id = $('#accountId').html();
				 				
				 				if($text === 'null') alert('You cannot save a blank note!');
				 				
				 				$.ajax({
				 					method: POST,
				 					url: "addNote?id=" + $id + "&text=" + $text;
				 				}).done(function(){
				 					window.location = "view?id=" + $id + "#noteText";
				 					window.reload();
				 				});
				 			});
					
					$("input[class='btnEdit']").click(
				 			function() {
				 				window.location.replace("update?id="
				 						+ $("input[id='account-id']").val());
				 			});

					$("input[class='btnCancel']")
							.click(
									function() {
										showChooseItemDialog($dialog,
												"#formCancel",
												"Are you sure you want to cancel editing this account?");
										return false;
									});

					$("input[class='btnDel']")
							.click(
									function() {
										showChooseItemDialog($dialog,
												"#deleteAccount",
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

function accounts_list() {
	window.location.replace("list");
}