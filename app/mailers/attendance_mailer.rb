class AttendanceMailer < ApplicationMailer
  default from: "no-reply@lucramassamy.fr"

  def creation_email(attendance)
    @attendance = attendance

    @event = Event.find @attendance.event_id

    @admin = User.find @event.administrated_event_id

    @participant = User.find @event.user_id

    mail(to: @admin.email, subject: "Nouveau participant !")
  end
end
