class Workout < ApplicationRecord
  belongs_to :user
  has_many :events, as: :happenings
end
