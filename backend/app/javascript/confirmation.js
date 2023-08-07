window.addEventListener('turbo:load', function () {
  // チェックボックスの状態変化を検知
  $("input[type='checkbox'][name='schedules[]']").change(function () {
    var url = $(this).data('url');            // 第4引数のdata-url属性の値を取得
    var scheduleId = $(this).val();           // 第2引数のvalue属性のschedule.idの値を取得
    var isChecked = $(this).is(':checked');   // チェック状態を取得
    var date = $("input[name='date']").val(); // 名前属性がdateのinput要素の値を取得

    // Ajax通信を開始
    $.ajax({
      beforeSend: function (xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
      },
      url: url,
      type: 'POST',
      data: { schedule_id: scheduleId, checked: isChecked, date: date },
      success: function (response) {
        // 必要に応じて成功時の処理を記述
        alert('確認状況が更新されました！');
      },
      error: function (response) {
        // 必要に応じてエラー時の処理を記述
        alert('確認状況の更新が失敗しました');
      }
    });
  });
});
