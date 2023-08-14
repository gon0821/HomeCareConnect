import consumer from "channels/consumer"

document.addEventListener("turbo:load", function(){
  if (document.getElementById('messages') != null) {
    if (document.getElementById('messages').dataset != null) {
      if (document.getElementById('messages').dataset.secretId != null) {

        let secretId = document.getElementById('messages').dataset.secretId;

        const appRoom = consumer.subscriptions.create({channel: "RoomChannel", secret_id: secretId}, {
          connected() {
            // console.log("Connected to the channel with secretId:", secretId); //　チャンネル接続したときの患者IDを確認
          },

          disconnected() {
          },

          received(data) {
            // console.log("メッセージを受け取った", data);
            const messages = document.getElementById('messages');
            const div = document.createElement('div');
            div.innerHTML = data['message'];  // 作成した<div>の内部に、受け取ったメッセージのHTML

            // console.log(data['message']); // 後でなぜmy-messageクラスがついているか調べる

            const messageUserId = div.querySelector('.message').dataset.userId;
            const currentUserId = document.getElementById('messages').dataset.currentUserId;
            if (messageUserId === currentUserId) {
              // console.log("自分のメッセージ");
              div.querySelector('.message').classList.add('my-message');
            } else {
              // console.log("他人のメッセージ");
              div.querySelector('.message').classList.add('other-message');
            }
            // console.log(div.firstElementChild);　// messages要素の先頭に挿入されるmessage内容確認
            messages.insertAdjacentElement('afterbegin', div.firstElementChild);
          },

          speak: function(message) {
            // console.log("これからメッセージを送る", message);
            return this.perform('speak', { message: message, secret_id: secretId});
          }
        });

        document.getElementById('new_message').addEventListener('submit', function(event) {
          let messageContent = document.getElementById('message_content');
            appRoom.speak(messageContent.value);
            messageContent.value = '';
            messageContent.style.height = 'auto'; // テキストエリアの高さを初期値に戻す
            event.preventDefault();
        });

      }
    }
  }

});

document.addEventListener("turbo:before-fetch-request", function () {
  var subscriptions = consumer.subscriptions['subscriptions'];

  subscriptions.forEach(function (subscription) {
    consumer.subscriptions.remove(subscription); // 他のページへ遷移した後に戻ってくると新たなsubscriptionが追加され、メッセージを投稿すると既存のsubscriptionに加えて新たなsubscriptionにもメッセージが送られ2回目以降、回数分のメッセージが表示されてしまう。そのため、ページ遷移するたびに既存のsubscriptionを削除する。
  });
  consumer.disconnect(); // 明示的にWebSocket接続を切断する。同じ端末で別のユーザーでログインしたときに、前のユーザーのWebSocket接続が残っていると、前のユーザーのメッセージが表示されてしまうため。
});
