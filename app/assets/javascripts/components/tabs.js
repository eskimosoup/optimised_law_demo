$(document).on("click", ".tab-toggle", function(e) {
  var toggleContainer = $(this).attr('href');

  $(toggleContainer).toggleClass('hide').siblings().addClass('hide');

  $(this).parent().parent().find('.active').removeClass('active');
  $(this).addClass('active');
  $('[data-equalizer-watch]').matchHeight();
});

$(document).on('click', '.service-overview-title-block', function() {
  $('.service-tab').removeClass('active');
  $('.service-overview-content').addClass('hide');
  $('.department-overview').removeClass('hide');

  $('[data-equalizer-watch]').matchHeight();
});

$(document).on('click', '.service-tab', function() {
  var container = $(this).attr('href');
  var href = $(container + ' .service-overview-read-more').attr('href');

  if(href !== undefined) {
    $('.team-members-link').attr('style', '').attr('href', href + '#team-members-carousel');
  } else {
    $('.team-members-link').attr('style', 'display:none;');
  }
});
