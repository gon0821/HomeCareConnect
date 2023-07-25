class RoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    user_ids = User.where(secret_patient_id: current_user.secret_patient_id).pluck(:id)
    @messages = Message.where(user_id: user_ids).order(:created_at)
  end
end
