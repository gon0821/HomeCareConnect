window.addEventListener('turbo:load', function () {
  $(".confirm-button").click(function () {
    var url = $(this).data('url');                     // data-url属性の値を取得
    var scheduleId = $(this).data('schedule-id');      // data-schedule-id属性のschedule.idの値を取得
    var isChecked = $(this).hasClass('confirmed');

    // Ajax通信を開始
    $.ajax({
      beforeSend: function (xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
      },
      url: url,
      type: 'POST',
      data: { schedule_id: scheduleId, checked: !isChecked},
      success: (response) => {
        if (response.success) {
          $(this).toggleClass('confirmed');
        }
      },
      error: function (response) {
        alert('確認状況の更新が失敗しました');
      }
    });
  });
});
