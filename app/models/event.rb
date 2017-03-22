class Event < ApplicationRecord
  # belongs_to :group
  # belongs_to :user
  # belongs_to :workout
  belongs_to :happenings, polymorphic: true

end
