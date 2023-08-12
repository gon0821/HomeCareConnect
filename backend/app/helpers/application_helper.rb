module ApplicationHelper
  def role_in_japanese(role)
    case role
    when 'patient'
      '患者'
    when 'family'
      '家族'
    when 'doctor'
      '医師'
    when 'nurse'
      '看護師'
    when 'care_manager'
      'ケアマネージャー'
    else
      '未定義'
    end
  end

  # 服用スケジュールで使用
  def japanese_weekday(date)
    english_to_japanese = {
      'Sun' => '日',
      'Mon' => '月',
      'Tue' => '火',
      'Wed' => '水',
      'Thu' => '木',
      'Fri' => '金',
      'Sat' => '土'
    }

    english_weekday = date.strftime('%a')
    english_to_japanese[english_weekday]
  end
end
