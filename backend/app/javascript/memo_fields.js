
window.addEventListener('turbo:load', function () {
  /** jQueryの処理 */
  $('.memo-toggle').each(function () {
    var memoContent = $(this).siblings('.memo-content');
    if (memoContent.text().trim() !== '') {  // trim()は文字列の前後の空白を削除するメソッド
      $(this).text('メ モ ▶');
    } else {
      $(this).text('');
    }
  });

  $('.memo-toggle').on('click', function () {
    var memoContent = $(this).siblings('.memo-content');
    if (memoContent.is(':visible')) {  // 要素が表示されているかどうかを判定するメソッド
      memoContent.fadeOut('slow');
      $(this).text('メ モ ▶')
    } else {
      memoContent.fadeIn('slow');
      $(this).text('メ モ ▼');
    }
  });
});
