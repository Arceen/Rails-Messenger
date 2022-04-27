// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "jquery"
import "bootstrap"
import "semantic-ui"
import "@hotwired/turbo-rails"
import "channels"

const scroll_bottom = function(){
  if ($('#messages').length>0){
    $('#messages').scrollTop($('#messages')[0].scrollHeight)
  }
};

let message_sent = function (){
  $('#mossage_body').on('keydown', function(e){
    if (e.key === 'Enter'){
      console.log('comes here');
      setTimeout(function(){
        
      $('#mossage_body')[0].value = '';
      },100);
    };
    
  })
    
};

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
  message_sent();
  scroll_bottom();

});
