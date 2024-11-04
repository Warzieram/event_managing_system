class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances
  has_many :administrated_event, foreign_key: "administrated_event_id", class_name: "Event"
  
end
