# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  def create
    # これから新しいUserインスタンスを作成する
    build_resource(sign_up_params)

    begin
      ActiveRecord::Base.transaction do
    # 役職が患者なら新しいPatientを作成し、役職が患者以外なら患者IDを検索して、見つかればその患者を紐付ける
        if resource.role == 'patient'
          resource.patient = Patient.create!
        elsif resource.secret_patient_id.present?
          patient =Patient.find_by(secret_id: resource.secret_patient_id)
          if patient.present?
            resource.patient = patient
          else
            resource.errors.add(:secret_patient_id, 'が見つかりません')
          end
        end
        # ユーザを保存する。保存に失敗した場合は例外が発生する
        resource.save!
      end

      # データベースに保存されたかどうかで処理を分岐
      if resource.persisted?
        # 新規に作成されたユーザーがアクティブ（つまり認証可能）な場合に以下が実行される
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up # フラッシュメッセージを設定
          sign_up(resource_name, resource) # ログイン状態にする
          respond_with resource, location: after_sign_up_path_for(resource) # 指定したページにリダイレクト
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}" # フラッシュメッセージを設定
          expire_data_after_sign_up! # ユーザーのセッションデータを削除
          respond_with resource, location: after_inactive_sign_up_path_for(resource) # 指定したページにリダイレクト
        end
      end
    # 例外処理　保存に失敗した場合
    rescue ActiveRecord::RecordInvalid => e
      clean_up_passwords resource   # パスワードを削除する
      set_minimum_password_length   # パスワードの最小文字数を設定する
      respond_with resource         # エラーを表示し、新規登録画面を再表示する
    end
  end

    private

    def sign_up_params
      params.require(:user).permit(:login_id, :name, :email, :password, :password_confirmation, :role, :secret_patient_id)
    end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
