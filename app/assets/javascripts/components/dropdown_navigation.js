$(document).on({
    mouseenter: function () {
      var $elem = $(this);
      var $dropdownElem = $elem.next('.dropdown');
      //$('.dropdown').not($dropdownElem).slideUp(250);
      //$dropdownElem.slideToggle(250, function() {
        $dropdownElem.find('[data-animation-type]').each(function() {
        var $elem = $(this);
        var effect = $(this).attr('data-animation-type');
        $elem.addClass('animated ' + effect)
              .on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
              function () {
                $elem.removeClass('visibility-hidden animated ' + effect);
              });
        //});
      });

      return false;
    },
    mouseleave: function () {
      //var $elem = $(this);
      //var $dropdownElem = $elem.next('.dropdown');
      //$dropdownElem.slideToggle(250);
    }
}, '.reveal-dropdown');


$(document).on({
    mouseenter: function () {
      var $elem = $(this);
      var $dropdownElem = $elem.closest('.dropdown');
      $dropdownElem.css('display', 'block');

      return false;
    },
    mouseleave: function () {
      var $elem = $(this);
      var $dropdownElem = $elem.closest('.dropdown');
      $dropdownElem.removeAttr('style');
    }
}, '.dropdown select');
