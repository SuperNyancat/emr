// 
//	dependencies:
//		jquery.js
//		jquery-ui.css
//		jquery-ui.js
//		create container with id "actionDialog"
//
$(document)
		.ready(
				function() {
					var $id = 0;
					$("input[name='account-group']").click(function() {
						$id = $(this).attr("id");
					});

					var $dialog = $('#dialogBox');
					$dialog.dialog({
						autoOpen : false,
						modal : true,
						resizable : false
					});

					$("input[class='btnCancel']").click(
							function() {
								showChooseItemDialog(
										$dialog,
										"../account/list",
										"Are you sure you want to cancel creating this account?");
							});

					$("input[class='btnEdit']").click(
							function() {
								if ($id > 0) {
									window.location
											.href = "update?id="
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
													"delete?id=" + $id,
													"Are you sure you want to delete this item?");
										} else {
											showNoSelectedItemDialog($dialog);
										}
									});

					$("input[class='btnExit']").click(function() {
						window.location.href = "../logout";
					});
					
					$("input[class='btnClear']")
						.click(
							function() {
								resetAccountList();
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

function account_create(){
	window.location.replace("create");
}

function resetAccountList(){
	$('#page').val('1'); 
	$('#letter').val('all');
	$('#sortBy').val('name');
	$('#ascending').val('true');
	$('input#name').val(''); 
	$('input#phone').val('');
	$('input#industry').val('');
	$('input#website').val('');
	$('#nameCriterion').val('contains'); 
	$('#phoneCriterion').val('contains');
	$('#industryCriterion').val('contains');
	$('#websiteCriterion').val('contains');
	$('#listDisplayConfig').submit();
}
