class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    unless current_user
      redirect_to new_user_session_path
    end
  end

  def create
    filterd_params = params.except(:authenticity_token, :commit)
    admin_id = current_user.id
    @event = Event.new(filterd_params.permit(
      :title,
      :description,
      :start_date,
      :duration,
      :location,
      :price
    ))

    @event.id = Event.all.length+1
    @event.administrated_event_id = current_user.id
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def show
    @event = Event.find params[:id]
    @admin = User.find @event.administrated_event_id
  end


end
