$(document).ready(function() {
	var swiper = new Swiper(".bannerSwiper", {
		spaceBetween: 0,
		centeredSlides: true,
		loop: true,
		autoplay: {
			delay: 2500,
			disableOnInteraction: false,
		},
		pagination: {
			el: ".bannerPage",
			clickable: true,
		},
		navigation: {
			nextEl: ".bannerNext",
			prevEl: ".bannerPrev",
		},
	});
});

$(document).ready(function() {
	var swiper = new Swiper(".jouSwiper", {
		slidesPerView: 1,
		centeredSlides: true,
		spaceBetween: 10,
		speed: 1000,
		pagination: {
			el: ".jouPage",
			clickable: true,
		},
		breakpoints: {
			780: {
				slidesPerView: 1.2,
				spaceBetween: 0,
				freeMode: true,
				mousewheel: {
					sensitivity: 0.3,
				},
			},
			1280: {
				slidesPerView: 2.3,
				spaceBetween: 0,
				freeMode: true,
				mousewheel: {
					sensitivity: 0.3,
				},
			}
		}
	});
});






