window.addEventListener('turbo:load', function () {

  var modal = document.getElementById('userSettingsModal');
  var btn = document.getElementById("openModal");
  var span = document.getElementById("closeModal");

  if(btn && modal) {
    btn.onclick = function () {
      event.preventDefault();  // リンク先を「#」にしており、ページの先頭に移動するのでそれを防ぎ、モーダルを表示するだけにする
      modal.style.display = "block";
    }
  }

  if(span && modal) {
    span.onclick = function () {
      modal.style.display = "none";
    }
  }

  if(modal) {
    window.onclick = function (event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }
  }
});
