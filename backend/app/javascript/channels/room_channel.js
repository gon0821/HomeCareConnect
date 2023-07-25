import consumer from "channels/consumer"

let secretId = document.getElementById('messages').dataset.secretId;

const appRoom = consumer.subscriptions.create({channel: "RoomChannel", secret_id: secretId}, {
  connected() {
    console.log("Connected to the channel with secretId:", secretId);
  },

  disconnected() {
  },

  received(data) {
    const messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', data['message']);
  },

  speak: function(message) {
    return this.perform('speak', { message: message, secret_id: secretId});
  }
});

document.getElementById('new_message').addEventListener('submit', function(event) {
  let messageContent = document.getElementById('message_content');
    appRoom.speak(messageContent.value);
    messageContent.value = '';
    event.preventDefault();
})
