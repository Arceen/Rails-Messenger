// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "jquery"
import "bootstrap"
import "semantic-ui"
import "@hotwired/turbo-rails"
$(document).on('turbo:load', function(){
    $('.ui.dropdown').dropdown();
    $('.message .close')
  .on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  })
;
});
