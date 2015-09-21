if (Modernizr.mq('only screen and (min-width: 768px)')) {
  $(document).on({
    mouseenter: function () {
     $(this).find('.state-hover').fadeIn(250);
    },
    mouseleave: function () {
      $(this).find('.state-hover').fadeOut(250);
    }
  }, ".hero-department");
} else {
  $(document).on('click', '.hero-department', function() {
    $(this).find('.state-hover').fadeToggle(250);
  });
}
