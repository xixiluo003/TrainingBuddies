class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :events, as: :happenings
  has_many :posts
  has_many :comments

  def self.search(search)
    where("last_name LIKE ?", "%#{search}%")
    where("first_name LIKE ?", "%#{search}%")
    where("email LIKE ?", "%#{search}%")
  end

end
