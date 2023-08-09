class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room_channel_#{message.user.secret_patient_id}", {message: render_message(message)}
  end

  def render_message(message)
    ApplicationController.render_with_signed_in_user(message.user, partial: 'messages/message', locals: {message: message})
  end
end
