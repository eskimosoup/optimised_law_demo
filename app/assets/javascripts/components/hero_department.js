$(document).on({
  mouseenter: function () {
   $(this).find('.state-hover').fadeIn(250);
  },
  mouseleave: function () {
    $(this).find('.state-hover').fadeOut(250);
  }
}, ".hero-department");
