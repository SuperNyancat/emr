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
					chooseSubCategory();

					
					var $id = 0;
					$("input[name='product-group']").click(function() {
						$id = $(this).attr("id");
					});

					var $dialog = $('#actionDialog');
					$dialog.dialog({
						autoOpen : false,
						modal : true,
						resizable : false
					});

					$("input[class='btnCancel']")
							.click(
									function() {
										showChooseItemDialog($dialog, "/list",
												"Are you sure you want to cancel creating this product?");
									});

					$("input[class='btnEdit']").click(function() {
						if ($id > 0) {
							window.location.href = "update?id=" + $id;
						} else {
							showNoSelectedItemDialog($dialog);
						}
					});

					$("input[class='btnDel']")
							.click(
									function() {
										if ($id > 0) {
											showChooseItemDialog($dialog,
													"delete?id=" + $id,
													"Are you sure you want to delete this item?");
										} else {
											showNoSelectedItemDialog($dialog);
										}
									});

					$("input[class='btnExit']").click(function() {
						window.location.href = "../logout";
					});

					$("#subCategory")
							.html(
									"<option value='Java Courses'>Java Courses</option><option value='Java Short Courses'>Java Short Courses</option><option value='Frameworks'>Frameworks</option><option value='EABC'>EABC</option><option value='Android Training'>Android Training</option><option value='Agile Training'>Agile Training</option>");

					$("#category")
							.change(
									function() {
										var val = $(this).val();
										if (val == "TRAINING") {
											$("#subCategory")
													.html(
															"<option value='Java Courses'>Java Courses</option><option value='Java Short Courses'>Java Short Courses</option><option value='Frameworks'>Frameworks</option><option value='EABC'>EABC</option><option value='Android Training'>Android Training</option><option value='Agile Training'>Agile Training</option>");
										} else if (val == "CONSULTING") {
											$("#subCategory")
													.html(
															"<option value='Software Engineering'>Software Engineering</option><option value='Project Management'>Project Management</option><option value='Business Analysis/Quality Assurance'>Business Analysis/Quality Assurance</option><option value='Business Analysis/Quality Assurance'>Business Analysis/Quality Assurance</option><option value='Creatives UI UX'>Creatives UI UX</option><option value='Systems Administration'>Systems Administration</option>");

										} else if (val == "GOOGLE_APPS") {
											$("#subCategory")
													.html(
															"<option value='Google Apps'>Google Apps</option>");
										}
									});
					
					
				});

function showNoSelectedItemDialog($dialog) {
	$dialog.html("<p>Please select from the items first.</p>").dialog({
		buttons : {
			Cancel : function() {
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

function product_list(){
	location.href= 'list';
}

function chooseSubCategory() {
	var selectCategory = /*$("#category");*/ document.getElementById("category");
	if (selectCategory.options[selectCategory.selectedIndex].text == 'Training') {
		$('#trainingSubCategory').css('display', 'inline');
		$('#consultingSubCategory').css('display', 'none');
		$('#subCategoryLabel').css('display', 'inline');
	} else if (selectCategory.options[selectCategory.selectedIndex].text == 'Consulting') {
		$('#trainingSubCategory').css('display', 'none');
		$('#consultingSubCategory').css('display', 'inline');
		$('#subCategoryLabel').css('display', 'inline');
	} else if (selectCategory.options[selectCategory.selectedIndex].text == 'Google Apps') {
		$('#trainingSubCategory').css('display', 'none');
		$('#consultingSubCategory').css('display', 'none');
		$('#subCategoryLabel').css('display', 'none');
	}
}