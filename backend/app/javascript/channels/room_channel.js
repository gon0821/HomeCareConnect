import consumer from "channels/consumer"

document.addEventListener("turbo:load", function(){
  if (document.getElementById('messages') != null) {
    if (document.getElementById('messages').dataset != null) {
      if (document.getElementById('messages').dataset.secretId != null) {

        let secretId = document.getElementById('messages').dataset.secretId;

        const appRoom = consumer.subscriptions.create({channel: "RoomChannel", secret_id: secretId}, {
          connected() {
            console.log("Connected to the channel with secretId:", secretId);
          },

          disconnected() {
          },

          received(data) {
            console.log("メッセージを受け取った", data);
            const messages = document.getElementById('messages');
            const div = document.createElement('div');
            div.innerHTML = data['message'];
            const messageUserId = div.querySelector('.message').dataset.userId;
            const currentUserId = document.getElementById('messages').dataset.currentUserId;
            if (messageUserId === currentUserId) {
              console.log("自分のメッセージ");
              div.querySelector('.message').classList.add('my-message');
            } else {
              console.log("他人のメッセージ");
              div.querySelector('.message').classList.add('other-message');
            }
            messages.insertAdjacentElement('afterbegin', div.firstElementChild);
          },

          speak: function(message) {
            console.log("これからメッセージを送る", message);
            return this.perform('speak', { message: message, secret_id: secretId});
          }
        });

        document.getElementById('new_message').addEventListener('submit', function(event) {
          let messageContent = document.getElementById('message_content');
            appRoom.speak(messageContent.value);
            messageContent.value = '';
            event.preventDefault();
        });

      }
    }
  }

});

document.addEventListener("turbo:before-fetch-request", function () {
  var subscriptions = consumer.subscriptions['subscriptions'];

  subscriptions.forEach(function (subscription) {
    consumer.subscriptions.remove(subscription);
  });
});
