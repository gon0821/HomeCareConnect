class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_patient

  def after_sign_in_path_for(resource)
    rooms_show_path   # 表示させたい画面へのパス
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path #ログイン画面へ遷移させている
  end

  # チャット機能　レンダリングのためのメソッド（ジョブにて使用）
  def self.render_with_signed_in_user(user, *args)
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap { |i| i.set_user(user, scope: :user) }
    renderer = self.renderer.new('warden' => proxy)
    renderer.render(*args)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login_id, :name, :role, :secret_patient_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login_id])
  end

  private

  def current_patient
    @current_patient ||= Patient.find_by(secret_id: current_user.secret_patient_id)
  end
end
