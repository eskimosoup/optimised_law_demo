$(document).on('click', '.reveal-dropdown', function() {
  var $elem = $(this);
  var $dropdownElem = $elem.next('.dropdown');
  $('.dropdown').not($dropdownElem).slideUp(250);
  $dropdownElem.slideToggle(250);
  return false;
});
