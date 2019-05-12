class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    member = Membership.where(user_id: current_user.id, room_id: params[:room]).first
    return unless member
    member.set_online
    stream_from "appearance_#{params[:room]}"
  end
 
  def unsubscribed
    member = Membership.where(user_id: current_user.id, room_id: params[:room]).first
    return unless member
    member.set_offline
  end
 
  def appear(data)
    current_user.appear on: data['appearing_on']
  end
 
  def away
    current_user.away
  end
end