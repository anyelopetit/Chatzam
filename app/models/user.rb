class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_secure_password
  has_many :memberships
  has_many :rooms, through: :memberships
  has_many :messages

  validates_uniqueness_of :username, :case_sensitive => false
  validates_presence_of :username
  validates :username, length: {maximum: 12}
  validates :first_name, :last_name, presence: true
end
