var g_dealer="";
var dealer_all="";
var dealerIdA="";
var GLO={
	CUR_URL:window.location.href,
	IE55:($.browser.msie&& navigator.appVersion.indexOf("MSIE 5.5") != -1),
	IE6:($.browser.msie && navigator.appVersion.indexOf("MSIE 6.0") != -1)
};

//jqready
$(function(){


	if($('.flexsliderV1')[0]){
		$('.flexsliderV1').flexslider({
			directionNav: false,
			animation:'slide',
			//pauseOnAction: false,
			directionNav: true,
			pauseOnHover: true
		});
	}
	$('.flexsliderV1').css('overflow','visible');

});

