class Attendance < ApplicationRecord

  after_create :creation_send

  def creation_send
    AttendanceMailer.creation_email(self).deliver_now
  end

  belongs_to :user
  belongs_to :event 
end
