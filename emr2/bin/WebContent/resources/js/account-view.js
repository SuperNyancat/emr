String.prototype.replaceAll = function( token, newToken, ignoreCase ) {
    var _token;
    var str = this + "";
    var i = -1;

    if ( typeof token === "string" ) {

        if ( ignoreCase ) {

            _token = token.toLowerCase();

            while( (
                i = str.toLowerCase().indexOf(
                    token, i >= 0 ? i + newToken.length : 0
                ) ) !== -1
            ) {
                str = str.substring( 0, i ) +
                    newToken +
                    str.substring( i + token.length );
            }

        } else {
            return this.split( token ).join( newToken );
        }

    }
return str;
};

$(document)
		.ready(
				function() {
					$("#btnShowHideNotes").css('margin-left', '24%');
					
					var $dialog = $('#dialogBox');
					$dialog.dialog({
						autoOpen : false,
						modal : true,
						resizable : false
					});
					
					$("#btnShowHideNotes")
						.on('change',
							function() {
								$('.note').toggle('fast', 'linear');
							});
					
					$("#btnSaveNote")
						.click(
							function() {
								var $accountId = $('#accountId').html();
								var $noteText = $('#noteText').val().replaceAll('\n', '</br>');
								
								if($noteText === '') {
									alert("You cannot save a blank note!");
									return;
								}
								else if($noteText.length > 150){
									alert("Maximum of 150 characters only!");
									return;
								}
								
								$.ajax({
									type: "POST",
									url: "addNote?id=" + $accountId + "&text=" + $noteText,
									success: function(){
										window.location = "view?id=" + $accountId + "#noteText";
									},
									failure: function(msg){
										alert(msg);
									}
								});

								$('#btnShowHideNotes').attr('checked', 'checked');						
								$(this).attr('class', 'btnFetch');
								$(this).attr('value','   Saving...');
								setTimeout(function(){location.reload()}, 1000);
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
					
					$("input[class='btnHide']")
						.click(
							function() {
								$(".txtArea").children().slice(1).toggle('fast', 'linear');
								$(".contactHide").toggle('fast', 'linear');
								$(".potentialHide").parent().toggle('fast', 'linear');
								if($("#btnShowHideNotes").is(':checked')){
									$(".note").show();}
								else{
									$(".note").hide();}
								if($(this).val() === 'Hide Details') { $(this).attr('value', 'Show Details'); }
								else { $(this).attr('value', 'Hide Details'); }
							});
					
					$('.saveLink').hide();
					
					$('.saveLink')
						.click(
							function(event) {
								event.preventDefault();
								var $input = $(this).closest('article').find('.editNote');
								var $text = $input.val().replaceAll('\n', '<br>');
								var $note = document.createElement("p");
								
								if($text === '') {
									alert("You cannot save a blank note!");
									return;
								} else if($text.length > 150) {
									alert("Maximum of 150 characters only!");
									return;
								} else {
									$note.className = "editNote";
									$note.innerHTML = $text;
									
									$input.replaceWith($note);
									$(this).hide();
									  
									var $edit = $(this).closest('article').find('.editLink'); 
									$($edit).show();
									  
									var $accountId = $('#accountId').html();
									var $noteId = $(this).closest('article').find('.noteId').html();
									
									$.ajax({
										type: "POST",
										url: "editNote?id=" + $accountId + "&noteid=" + $noteId + "&text=" + $text
									});
								}
							});
					
					$('.editLink')
						.click(
							function(event) {
								  event.preventDefault();
								  var $note = $(this).closest('article').find('.editNote');
								  var $text = $note.html();
								  var $input = document.createElement("textarea");
								  
								  $input.className = "editNote";
								  $input.type = "text";
								  $input.value = $text.replaceAll('<br>', '\r\n');
								  $($input).css("width", "96%");
	
								  $note.replaceWith($input);
								  $(this).hide();
						    		
								  var $link = $(this).closest('article').find('.saveLink'); 
								  $($link).show();
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

