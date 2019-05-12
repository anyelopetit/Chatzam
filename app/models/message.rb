class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates_presence_of :content, :user_id, :room_id

  after_create_commit { MessageBroadcastJob.perform_later(self) }
end