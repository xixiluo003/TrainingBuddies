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


end
