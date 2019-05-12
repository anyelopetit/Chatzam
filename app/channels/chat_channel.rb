class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"
  end

  def receive(data)
    ActionCable.server.broadcast "chat_#{params[:room]}", data
  end

  def unsubscribed
    Stop_all_streams
  end

  def create(options)
    Message.create(
      content: options.fetch('content'),
      user_id: options.fetch('userId')
    )
  end
end