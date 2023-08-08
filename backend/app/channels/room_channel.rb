class RoomChannel < ApplicationCable::Channel
  def subscribed
    patient = Patient.find_by(secret_id: params[:secret_id])
    if patient && patient.secret_id == current_user.secret_patient_id
      channel_name = "room_channel_#{patient.secret_id}"
      puts "Subscribed to channel: #{channel_name}" # ログ出力

      stream_from "room_channel_#{patient.secret_id}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    if current_user.secret_patient_id == data['secret_id']
      Message.create!(content: data['message'], user_id: current_user.id)
    end
  end
end
