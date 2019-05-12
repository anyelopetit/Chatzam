class NewCommentJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast \
      "web_notifications_#{current_user.id}", { title: 'New things!', body: 'All the news that is fit to print' }

    ActionCable.server.broadcast \
      "chat_#{room}", { sent_by: 'Paul', body: 'This is a cool chat app.' }
  end
end