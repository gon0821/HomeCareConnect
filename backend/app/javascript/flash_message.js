
  document.addEventListener('turbo:load', (event) => {
    setTimeout(function () {
      let flashes = document.getElementsByClassName('flash');
      for (let i = 0; i < flashes.length; i++) {
        let flash = flashes[i];
        flash.style.opacity = 0;
        flash.style.transition = 'opacity 1.0s linear';
      }
    }, 3000);
  });
