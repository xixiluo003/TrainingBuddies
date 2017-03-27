class Group < ApplicationRecord

  belongs_to :user
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :events, as: :happenings
  has_many :posts


end
