$(document).keyup(function(e) {
  // Close modals on ESC key press
  if (e.keyCode == 27 && $('.modal-call-to-action').is(':visible')) {
    $('.modal-call-to-action').slideUp();
  }
});
