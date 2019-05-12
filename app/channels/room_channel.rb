
class RoomChannel < ApplicationCable::Channel
  # calls when a client connects to the server
  def subscribed
    return unless params[:room].present?
    # creates a private chat room with a unique name
    stream_from "room_#{params[:room]}"
  end
  def unsubscribed
    Stop_all_streams
  end

  # calls when a client broadcasts data
  def speak(data)
    sender    = get_sender(data)
    room_id   = data['room_id']
    message   = data['message']

    raise 'No room_id!' if room_id.blank?
    convo = get_room(room_id) # A conversation is a room
    raise 'No conversation found!' if convo.blank?
    raise 'No message!' if message.blank?

    # adds the message sender to the conversation if not already included
    convo.users << sender unless convo.users.include?(sender)
    # saves the message and its data to the DB
    # Note: this does not broadcast to the clients yet!
    message = current_user.messages.create!(
      room: convo,
      sender: sender,
      content: message
    )
    return unless message.errors.present?
    transmit(type: 'chat_rooms', data: message.error.full_messages)
  end

  # Helpers

  def get_room(id)
    Room.find_by(id: id)
  end

  def set_sender
    User.find_by(id: id)
  end
end