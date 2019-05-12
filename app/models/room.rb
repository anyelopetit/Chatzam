class Room < ApplicationRecord
  has_many :memberships
  has_many :messages
  has_many :users, through: :memberships

  validates :name, presence: true, length: { maximum: 16 },
    uniqueness: true, case_sensitive: false

  def owner
    "#{object.user.first_name} #{object.user.last_name}"
  end

  def created_at
    object.created_at.strftime("%d/%m/%Y")
  end
end
