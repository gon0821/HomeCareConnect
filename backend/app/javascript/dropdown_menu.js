window.addEventListener('turbo:load', function () {
  var userIcon = document.getElementById('userIcon');
  var userDropdown = document.getElementById('userDropdown');

  if (userIcon && userDropdown) {  // ユーザーアイコンとドロップダウンが存在する場合
  userIcon.addEventListener('click', function () {
    event.stopPropagation(); // イベントの伝播を停止
    userDropdown.style.display = (userDropdown.style.display === 'none' || userDropdown.style.display === '') ? 'block' : 'none';
  });
  // ドキュメント全体にクリックイベントリスナーを追加
  document.addEventListener('click', function () {
    userDropdown.style.display = 'none'; // ドロップダウンを閉じる
  });
  }
});
