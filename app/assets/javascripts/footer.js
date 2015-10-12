$(document).foundation({
  equalizer : {
    // Specify if Equalizer should make elements equal height once they become stacked.
    equalize_on_stack: false,
    // Allow equalizer to resize hidden elements
    act_on_hidden_el: false
  },
  joyride : {
    pre_ride_callback: function () {
      if($('.joyride-list li:last-of-type').data('next-page') !== '') {
        $('.joyride-tip-guide:last .joyride-next-tip').attr('href', $('.joyride-list li:last-of-type').data('next-page')).toggleClass('joyride-next-tip right');
      } else {
        $('.joyride-tip-guide:last .joyride-next-tip').remove();
      }
    },
  }
});

$(function() {
  $('.joyride-list li').each(function() {
    if($('#' + $(this).data('id')).length === 0) {
      $(this).remove();
    }
  });
});

function dismissTourPopup() {
  $('.lightbox').fadeOut();
  $.cookie('law-tour', '1', { expires: 21, path: '/' });
}

if (Modernizr.mq('only screen and (min-width: 1024px)')) {
  $(window).load(function() {
    if($.cookie('law-tour') === undefined) {
      $('.lightbox').removeClass('hide');
    }

    var field = 'tour';
    var url = window.location.href;
    if ((url.indexOf('?' + field + '=') != -1) || (url.indexOf('&' + field + '=') != -1)) {
      setTimeout(function() { $(document).foundation('joyride', 'start'); }, 750);
    }
  });

  $(document).on('click', '.dismiss-tour', function() {
    dismissTourPopup();
  });

  $(document).on('click', '.tour-button', function() {
    $(document).foundation('joyride', 'start');
    dismissTourPopup();
  });
}
