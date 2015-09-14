$(document).on("click", ".tab-toggle", function(e) {
  var toggleContainer = $(this).attr('href');

  $(toggleContainer).toggleClass('hide').siblings().addClass('hide');

  $(this).parent().parent().find('.active').removeClass('active');
  $(this).addClass('active');
  $('[data-equalizer-watch]').matchHeight();
});
