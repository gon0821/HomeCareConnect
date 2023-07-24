import consumer from "channels/consumer"

const appRoom = consumer.subscriptions.create("RoomChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    const messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', data['message']);
  },

  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});

document.getElementById('new_message').addEventListener('submit', function(event) {
  let messageContent = document.getElementById('message_content');
    appRoom.speak(messageContent.value);
    messageContent.value = '';
    event.preventDefault();
})
