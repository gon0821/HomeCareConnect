window.addEventListener('turbo:load', function () {
  $(document).ready(function () {
    $('#message_content').on('input', function () { //入力し始めたらイベント発火
      this.style.height = 'auto';
      this.style.height = (this.scrollHeight) + 'px';
    });
  });
});
