$(document).ready(function(){
	$(".product_show ul li").hover(
		function(){$(this).addClass("hover2")},function(){$(this).removeClass("hover2")}
	)
})

$(document).ready(function(e) {
	$(".header2 .header2_btn").click(function() {
		//$(".menu_hide").toggleClass("active"); //同一个按钮显示隐藏
		$(".menu_hide").addClass("active");
	});
	$(".menu_hide dl dt .close_m").click(function() {
		//$(".menu_hide").toggleClass("active"); //同一个按钮显示隐藏
		$(".menu_hide").removeClass("active");
	});
});



//header滚动
$(function() {
	$(window).scroll(function() {
		100 < $(this).scrollTop() ? $(".header").addClass('fixed') : $(".header").removeClass('fixed');
	});
});

//滚动条向上
$(document).ready(function(e) {
$(window).scroll(() => {
    // 滚动条距文档顶部的距离, || 是做兼容处理的
    let scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
    // 滚动条滚动的距离
    let scrollStep = scrollTop - this.oldScrollTop            
    // 更新-滚动前,滚动条到文档顶部的距离
    this.oldScrollTop = scrollTop
 
    if (scrollStep > 0) {
          $(".header").removeClass("active");
    }
    else {
          $(".header").addClass("active");
    }
})

});

//slide切换
$(document).ready(function() {
	var ary = location.href.split("&");
	jQuery(".iCaseWarp").slide({
		titCell: ".iCaseTab ul li",
		mainCell: ".iCasePanel",
		trigger: "click"
	});
	jQuery(".iCaseWarp").slide();
})

//页面滚动
$(function() {
	$(window).scroll(function() {
		100 < $(this).scrollTop() ? $(".toTop").addClass('active') : $(".toTop").removeClass('active');
	});
});


//页脚栏目
$(function(){
    $('.footer .fMenu').on('click','.fMenuTitle .fMenuOpen',function(){
        var _this = $(this).parents('.fMenuTitle');
        _this.next('.list').slideToggle();
    })
});


//点击子子按钮父级兄弟显示
$(function(){
    $('.footer .fMenu').on('click','.fMenuTitle .fMenuOpen',function(){
        var _this = $(this).parents('.fMenuTitle');
        _this.next('.list').slideToggle();
    })
});

$(document).ready(function() {
	$(".list ul li").click(function() {
		$(this).addClass('active').siblings().removeClass('active');
	});
})

//点击之后兄弟添加类名
$(document).ready(function() {
	$(".proList .proTab").click(function() {
		$(this).next('.proPanel').addClass('active');
	});
	$(".proClose").click(function() {
		$(".proPanel").removeClass("active");
	});
})