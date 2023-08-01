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
end
