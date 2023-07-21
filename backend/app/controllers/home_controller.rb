class HomeController < ApplicationController
  def index
    @secret_patient_id = current_user.secret_patient_id if user_signed_in?
  end
end
