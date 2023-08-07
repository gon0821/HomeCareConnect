function timeDisplay() {
  const timeInputs = document.querySelectorAll('.time-input'); // ラベルも含む
  const timeFields = document.querySelectorAll('.time-field'); // 入力欄のみ

  timeFields.forEach((field, index) => { // 入力欄の数だけ繰り返す
    field.addEventListener('input', function () { // 入力欄に入力されたら
      if (this.value && index < timeInputs.length - 1) { // 入力されていて、最後の入力欄でない
        timeInputs[index + 1].classList.add('visible'); /* ここでクラスを追加 */
      }
    });
  });
}

document.addEventListener('turbo:load', timeDisplay); // ページ遷移時
document.addEventListener('turbo:render', timeDisplay); // バリデーションエラー時
