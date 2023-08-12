window.addEventListener('turbo:load', function () {

  var modal = document.getElementById('userSettingsModal');
  var btn = document.getElementById("openModal");
  var span = document.getElementById("closeModal");

  if(btn && modal) {
    btn.onclick = function () {
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
