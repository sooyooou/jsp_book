// JavaScript Document
var $slide_best;
var $slide_new
var currentslide;
var slideWIDTH;
var intervalID;

$(document).ready(function(){
	init();
	slides();
	slides_onoff();
	popup();
	menuu();
})

function init(){
	$slide_best=$("#slide_best");
	$slide_new=$("#slide_new");
	currentslide=0;
	slideWIDTH=1000;
	
}

function menuu(){
	var GNB=$("#gnb > li");
	var LNB=$(".lnb");
	
	GNB.hover(function(){
		var tg=$(this);
		var i=tg.index();
		LNB.eq(i).stop().slideDown("fast");
	}, function(){
		LNB.stop().slideUp("fast");
	})
}

function slides(){
	intervalID =setInterval(slide_on, 2000);
}

function slide_on(){
	var newLEFT=-slideWIDTH*currentslide;
	$slide_best.stop().animate({
		left:newLEFT
	}, 400,"swing");
	$slide_new.stop().animate({
		left:newLEFT
	}, 400,"swing");
	
	if(currentslide >=2) {
		currentslide=0;
	} else {
		currentslide++;
	}
}

function slides_onoff(){
	$(".best_img").hover(function(){
		clearInterval(intervalID);
		}, function(){
		intervalID=setInterval(slide_on, 2000);
	})
	$(".new_img").hover(function(){
		clearInterval(intervalID);
		}, function(){
		intervalID=setInterval(slide_on, 2000);
	})
}

function popup(){
	open_pop();
	close_pop();
}

function open_pop(){
	$(".ub_login").click(function(){
		$("#popupLayer").fadeIn("fast");
	})
}

function close_pop(){
	$("#popup_close").click(function() {
		$("#popupLayer").fadeOut("fast");
	})
}