class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    rooms_show_path   # 表示させたい画面へのパス
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path #ログイン画面へ遷移させている
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login_id, :name, :role, :secret_patient_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login_id])
  end
end
