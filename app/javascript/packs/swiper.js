import Swiper from 'swiper';


$(document).ready(function () {

var swiper = new Swiper('.swiper-container', {



speed: 3000,
effect: "fade",
fadeEffect: {
crossFade: true
},

//   autoplay: 1000,
autoplay: {
    delay: 5000,
    disableOnInteraction: false,
  },
slidesPerView: 1,
//   pagination: {
//     el: ".swiper-pagination",
//     type: "progressbar"
//   },
navigation: {
nextEl: ".swiper-button-next",
prevEl: ".swiper-button-prev"
}
})
});

function getDirection() {
  var windowWidth = window.innerWidth;
  var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';
  return direction;
}
