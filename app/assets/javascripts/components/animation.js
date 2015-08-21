// Potential usage: data-animation-type='slideInUp', data-animation-delay='500'
// https://daneden.github.io/animate.css/

function animateIn() {
  var $elem = $(this);
  var animationType  = $elem.attr('data-animation-type');
  var animationDelay = $elem.attr('data-animation-delay');

  if( animationDelay !== undefined )  {
    setTimeout(function() {
      $elem.removeClass('visibility-hidden').addClass('animated ' + animationType);
    }, animationDelay);
  } else {
    $elem.removeClass('visibility-hidden').addClass('animated ' + animationType);
  }
}

function animateOut() {
  var $elem = $(this);
  var animationType = $elem.attr('data-animation-type');
  $elem.removeClass('animated ' + animationType).addClass('visibility-hidden');
}

$(function() {
  $('[data-animation-type]').addClass('visibility-hidden');

  $('[data-animation-type]').onScreen({
    tolerance: 0,
    toggleClass: 'onScreen',
    doIn: animateIn,
    doOut: animateOut
  });
});

// https://github.com/matthieua/WOW/issues/20
/*
$(document).on('mouseover', '.scroll-up', function () {
  var $elem = $(this);
  var effect = 'bounceIn';

  $elem.addClass('animated ' + effect)
       .on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
      function () {
        $elem.removeClass('animated ' + effect);
      });
});
*/
