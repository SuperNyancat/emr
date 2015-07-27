/*
	scripts.js
*/
$(document).ready(function(){
	/*for top menu user profile*/
	var udetails = $(".userDetails");
	udetails.hide();
	$(".userInfo a").on('mouseenter', function(){
		udetails.slideDown(200);		
	});
	udetails.on('mouseleave', function(){
		udetails.slideUp(200);		
	});

	/*for top menu more options*/
	var optlist = $(".moreOptList");
	optlist.hide();
	$(".moreOpt a").hover(function(){
		optlist.slideDown(200);		
	});
	optlist.mouseleave(function(){
		optlist.slideUp(200);		
	});
	

	/*pageCtrl height*/
	var pagectrl = $('pageCtrl');
	
	
	/*for seach tool	*/
 /* var tableSearch = $('.tableSearch');
      	  tableSearch.css({'height': '5px','overflow':'hidden'});
		
	var searchTool = $('.searchTool');
	      searchTool.find('a').on('mouseover', function(){
			tableSearch
				.animate({height:'100px'}, "slow");
		  });
	      searchTool.find('a').on('mouseleave', function(){
			tableSearch
				.animate({height:'5px'}, "slow");
		  }); 
			 */
	
	/*get height of formTop*/
	var topAside = $('.formTop').outerHeight();
	$('.formTop aside.top').height(topAside);
		
	/*locate dropdown list*/
	/* 
		var asideList = $(".rLinks > ul");
		asideList.hide();
		$(".rLinks > h3 > a").hover(function(){
			 asideList.slideDown(200);		
		});
		asideList.mouseleave(function(){
			 asideList.slideUp(200);		
		}); 
	*/	
	 
	/*for popup forms*/
	var addpopup = $('.addPopUp');	
	var addpopupnewuser = $('.newuser');
	
	/*add new user form*/
	$('.bntNewUser').click(function(){
		addpopupnewuser.show(200);
	});	
	$('.cancelnewuser').click(function(){
		addpopupnewuser.hide(200);
	});	
	
	/*add new product form*/
	var addnew = $('addNew');
	
		$('.btnNew').on('mouseover', function(){
			$(this).parent('li').addClass('activeli');		
			
		var activeli = $('.activeli');

		if(activeli.find('.btnNew').data('attr') == "addproduct"){	
			$('.addProduct').show(/* 200200 */); 			
		} 
		
		if(activeli.find('.btnClose')){
			$('.btnClose').click(function(){
				$(this).parents('.addPopUp').hide(/* 200 */);	
				
			});
		}
		

	});
	

		
	/*dynamic*/
	addpopup.css('margin-top', topAside+13); //push it down
	
	
	/* show/hide pop-up forms	*/	
	addpopup.hide(); //hide all forms
	
	var potential = $('.potential');
	var contact   = $('.contact');
	var task       = $('.task');
			
	var qul = $('.qActions').find('ul');
	
	qul.on('mouseenter', 'li', function(){
		var thisA = $(this).find('a');
			  
			  thisA.addClass('aHover')
						.find('span')
						.addClass('spanHover');
					
			 if(thisA.hasClass('addPotential')){
				contact.hide();
				task.hide();
				resetA();
				moreField.hide(200);
				connectMoreField.hide(100);
				recc.hide(200);
				connectRecc.hide(100);
				
				potential.show();
				potential.addClass('open');								
			 }	
			 if(thisA.hasClass('addContact')){
				potential.hide();
				task.hide();
				resetA();
				moreField.hide(200);
				connectMoreField.hide(100);
				recc.hide(200);
				connectRecc.hide(100);

				
				contact.show();
				contact.addClass('open');
			 }		
			 if(thisA.hasClass('addTask')){
				potential.hide();
				contact.hide();
				resetA();
				
				task.show();
				task.addClass('open');
			 }	
			
			//reset a link
			function resetA(){
				thisA.parent().siblings()
						.find('a').removeClass('aHover')
						.find('span').removeClass('spanHover');	
			}
	});//end qul.on
	
	//close all opened popup
	var open = $('.open');
	if(open.find('btnClose')){
		var btnclose = $('.btnClose');
		btnclose.on('click', function(){
		
			$(this).parents('div.open')
				.hide()
				.removeClass('open');					
			//reset
			qul
				.find('a').removeClass('aHover')
				.find('span').removeClass('spanHover');			
		});			
	}//end open.find	
	
	
	/*For Settings: Roles: show userList*/
	var userList = $('.userList').find('ul');
	var viewLink = $('.userList').find('li');
		
/* 	$(".listpopup").hide(); */
/* 	 viewLink.on('mouseenter', 'a', function(){
		
		
		$(this)
				.next()
					.show(200)
					.addClass('active');	
					
	
				
	});  */
/* userList.on('mouseleave', function(){
		$(this)			
				.hide(200)
				.removeClass('active');			
	}); 
	   */
/* 	 
$(".userList").mouseleave(function(){
		$(this).find('.listpopup')			
				.slideUp(200);
});  

	 
$(".list1").hover(function () {
		$(this).find('listpopup')
				.show(200);
	});  */


	
/* Settings-ViewRoles */	/* 
$('.list1').mouseenter(function(){
		$('.listpopup').show(200);
		$('.listpopup2').hide(200);
		$('.listpopup3').hide(200);
	});
	
	$('.list2').mouseenter(function(){
		$('.listpopup').hide(200);
		$('.listpopup2').show(200);
		$('.listpopup3').hide(200);
	});
	
	$('.list3').mouseenter(function(){
		$('.listpopup').hide(200);
		$('.listpopup2').hide(200);
		$('.listpopup3').show(200);
	});  */

	
	
/* POTENTIAL PAGE  (view tab) */
 var viewpotential = $('.viewTableWrapper');
 viewpotential.hide();
 
$('.btnViewPotential').mouseenter(function(){
	addpopup.hide();
	viewpotential.slideDown(200);
});

viewpotential.mouseleave(function(){
	viewpotential.slideUp(200);});
	
	$('.btnAddPotential').mouseenter(function(){
		viewpotential.hide();
	});
	
	
		
/* PRODUCT LISTING PAGE (newProduct) */

var newproduct = $('.newProduct');
	$('.btnNewProduct').click(function(){
		newproduct.slideDown(200);
	});
/* 	
 	$('.closeProduct').click(function(){
		newproduct.slideUp(200);
	});	
	  */
	  

	  /* MORE FIELDS POP UP */


		var moreField = $('.moreField_wrapper');
		var connectMoreField = $('.aHover_moreFields');
		 moreField.hide(); 
		 connectMoreField.hide();	 
		
		$('.moreTask2').mouseenter(function(){
			moreField.show(200);
			connectMoreField.show(100);
			recc.hide(200);
			connectRecc.hide(100);
		});
		
		
		$('.btnCancel').click(function(){
			moreField.hide(200);
			connectMoreField.hide(100);
			recc.hide(200);
			connectRecc.hide(100);
		});

		var recc = $('.recc_wrapper');
		var connectRecc = $('.aHover_recc');
		 recc.hide(); 
		 connectRecc.hide();
		 
		$('.moreTask1').mouseenter(function(){
			recc.show(200);
			connectRecc.show(100);
			moreField.hide(200);
			connectMoreField.hide(100);
		});
	  
		
	/* EDIT/DELETE HOVER */	
		
		var edit = $('.edit_popup');
		edit.hide();
/*			
 	$('.blue').mouseenter(function(){
		$(this)
			.next()
				.slideDown(200);
	}); 
	
	 */

$("tr").mouseleave(function(){
		$(this).find('.edit_popup')			
				.slideUp(200);
});  
	 

$("tr").not(':first').hover(
	function () {
			$(this).find('.edit_popup')
			.slideDown();
	}, 
  
	function () {
			$(this).css("background","");
  }
);
	

/* HIDE DETAILS */
$(".btnHide").click(function(){
	$('.fieldHide').toggle(200);
	$('.moreHide').toggle(200);
	$('.attachHide').toggle(200);
	$('.potentialHide').toggle(200);
	$('.contactHide').toggle(200);
	$('.activitieshide').toggle(200);
	$('.closedActHide').toggle(200);
	$('.casesHide').toggle(200);
	$('.note').toggle(200);
	$('.bside').toggle(200);
	$('.tDetails').toggle(200);
});	

/*Back to Top*/
$(".btnTop").click(function () {
   $("html, body").animate({scrollTop: 0}, 1000);
});
	

/* POPUP WINDOW */

var contact_form = $('.bgWindow');
contact_form.hide();  

	  
	  
$('.btnNewContact').click(function(){
	contact_form.fadeIn(500); });

$('.btnCancel_win').click(function(){
	contact_form.fadeOut(500); });

	
$('.search_contact').click(	
function PopWindow()
{
window.open('popupwindow_contact.html','MyWindow','width=800,height=475,menubar=yes,scrollbars=yes,toolbar=yes,location=yes,directories=yes,resizable=yes,top=55,left=55'); });

	
$('.search_account').click(	
function PopWindow()
{
window.open('popupwindow_account.html','MyWindow','width=800,height=475,menubar=yes,scrollbars=yes,toolbar=yes,location=yes,directories=yes,resizable=yes,top=55,left=55'); });
}); 



