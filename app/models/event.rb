class Event < ApplicationRecord

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :administrated_event, class_name: "User"
end
