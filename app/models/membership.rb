class Membership < ApplicationRecord

  belongs_to :user
  belongs_to :room

  validates_presence_of :room_id
  validates_presence_of :user_id
  validates_uniqueness_of :user_id, :scope => :room_id
  after_update_commit {AppearanceBroadcastJob.perform_later self}

  def name
    User.find(user_id).username
  end

  def set_online
    update_attributes(online: true)
  end

  def set_offline
    update_attributes(online: false)
  end
end
