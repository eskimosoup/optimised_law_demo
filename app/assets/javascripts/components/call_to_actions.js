$(document).keyup(function(e) {
  // Close modals on ESC key press
  if (e.keyCode == 27 && $('.modal-call-to-action').is(':visible')) {
    $('.modal-call-to-action').slideUp();
  }
});

function hideStickyCTA() {
  var $elem = $('.service-overview-fixed-contact-methods');
  var animationType = $elem.attr('data-animation-type');
  $elem.removeClass('animated ' + animationType).addClass('visibility-hidden');
}

function showStickyCTA() {
  var $elem = $('.service-overview-fixed-contact-methods');
  var animationType  = $elem.attr('data-animation-type');
  var animationDelay = $elem.attr('data-animation-delay');

  $elem.removeClass('hide');
  
  if( animationDelay !== undefined )  {
    setTimeout(function() {
      $elem.removeClass('visibility-hidden').addClass('animated ' + animationType);
    }, animationDelay);
  } else {
    $elem.removeClass('visibility-hidden').addClass('animated ' + animationType);
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
