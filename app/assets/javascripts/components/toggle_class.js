$(document).on("click", ".toggle-class", function(e) {
  var toggleContainer = $(this).attr('data-container');
  var toggleClass     = $(this).attr('data-class');
  var dataReturn      = $(this).attr('data-return');

  $(toggleContainer).toggleClass(toggleClass);
  $('[data-equalizer-watch]').matchHeight();


  if (Modernizr.mq('only screen and (min-width: 767px)')) {
    if (dataReturn === 'false') {
      e.preventDefault();
    }
  }
});

$(document).on("click", ".slide-toggle-class", function(e) {
  var $self = $(this);
  var toggleContainer = $self.attr('data-container');
  var dataReturn      = $self.attr('data-return');
  var $toggleContainer = $(toggleContainer);
  var containerClass   = toggleContainer.split('.');

  $containerClass = $('.' + containerClass[1]);
  $containerClass.not($toggleContainer).attr('style', '');
  $toggleContainer.slideToggle(toggleContainer, function() {
    $('[data-equalizer-watch]').matchHeight();
    if (Modernizr.mq('only screen and (max-width: 768px)') && $self.attr('href') != '#') {
      window.location = $self.attr('href');
    }
  });

  if (dataReturn === 'false') {
    e.preventDefault();
  }
});
