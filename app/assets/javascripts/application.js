// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require slick.js.js
//= require components/dropdown_navigation
//= require components/hero_audience
//= require components/toggle_class
//= require components/animation
//= require components/call_to_actions
//= require components/tabs
//= require components/tooltips
//= require components/smooth_scroll
//= require vendor/foundation/libraries/jquery.cookie.js
//= require vendor/foundation/foundation.js
//= require vendor/foundation/foundation.joyride
//= require vendor/onscreen
$(document).on('click', '.invalid-link', function() {
  return false;
});
