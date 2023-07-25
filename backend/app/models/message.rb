class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }

  belongs_to :user

  validates :content, presence: true
end
