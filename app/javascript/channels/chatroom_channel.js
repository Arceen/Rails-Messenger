import consumer from "channels/consumer"
const scroll_bottom = function(){
  if ($('#messages').length>0){
    $('#messages').scrollTop($('#messages')[0].scrollHeight)
  }
};
consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    $('#message-container').append(data.mod_message);
    scroll_bottom();
  }
});
