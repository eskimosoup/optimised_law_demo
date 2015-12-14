$(document).keyup(function(e) {
  // Close modals on ESC key press
  if (e.keyCode == 27 && $('.modal-call-to-action').is(':visible')) {
    $('.modal-call-to-action').slideUp();
  }
});

function hideStickyCTA() {
  var $elem = $('.service-overview-fixed-contact-methods');
  var animationOut = $elem.attr('data-animation-out');
  var animationIn = $elem.attr('data-animation-in');
  var animationDelay = 750 + parseInt($elem.attr('data-animation-delay'));
  $elem.removeClass('animated ' + animationIn).addClass('animated ' + animationOut);

  setTimeout(function() {
    $elem.addClass('visibility-hidden');
  }, animationDelay);
}

function showStickyCTA() {
  var $elem = $('.service-overview-fixed-contact-methods');
  var animationIn  = $elem.attr('data-animation-in');
  var animationOut  = $elem.attr('data-animation-out');
  var animationDelay = $elem.attr('data-animation-delay');

  $elem.find('.call-to-action-content-wrap').removeAttr('style');
  $elem.removeClass('animated ' + animationOut);

  if( animationDelay !== undefined )  {
    setTimeout(function() {
      $elem.removeClass('visibility-hidden').addClass('animated ' + animationIn);
    }, animationDelay);
  } else {
    $elem.removeClass('visibility-hidden').addClass('animated ' + animationIn);
  }
}

$(function() {
  setTimeout(function() {
    $('.service-overview-contact-methods').onScreen({
      tolerance: 0,
      doIn: hideStickyCTA,
      doOut: showStickyCTA
    });
  }, 1500);
});
