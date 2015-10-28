// jQuery tooltip

// Inspired by http://www.mkyong.com/jquery/how-to-create-a-tooltips-with-jquery/
function changeTooltipPosition(event) {
  var tooltipX = event.pageX - 40;
  var tooltipY = event.pageY - 45;
  $('.tooltip').css({
    top: tooltipY,
    left: tooltipX
  }).fadeIn(250);
}

function showTooltip(event, elem) {
  $('.tooltip').hide();
  changeTooltipPosition(event);
}

function hideTooltip() {
  $('.tooltip').fadeOut(250);
}

$(function() {
  $('a[href="#no-link"]').addClass('invalid-link');
  $('.modal-call-to-action input[type=submit]').addClass('invalid-link').attr('disabled');
  $('<div class="tooltip">This is not active because this website is a demo.</div>').appendTo('body');
});

$(document).on({
  mouseenter: function (e) {
    showTooltip(e, $(this));
  },
  mouseleave: function () {
    hideTooltip();
  }
}, '.invalid-link');
