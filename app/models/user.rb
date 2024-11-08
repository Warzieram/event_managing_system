class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def name
    self.first_name + " " + self.last_name
  end
  has_many :attendances
  has_many :events, through: :attendances
  has_many :administrated_event, foreign_key: "administrated_event_id", class_name: "Event"
  has_one_attached :avatar
end
