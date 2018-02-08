class EventsController < ApplicationController
  def new
    @current_user ||= User.find_by(id: session[:user_id])

    @user = @current_user

    unless @user
      flash.now[:danger] = 'connect before create an event'
      redirect_to login_path
    else
      @event = @user.events.new
    end

  end

  def index
    events = Event.all
    @past_events =[]
    @future_events = []

    events.each do |event|
      if event.date < Date.current
        @past_events << event
      else
        @future_events << event
      end
    end
  end


  def show
    if session[:user_id]
      @event = Event.find(params[:id])
      creation = Creation.find_by(event_id: @event.id)
      @event_creator = creation.user
      participations = Registration.where(event_id: @event.id)

      @current_user = User.find_by(id: session[:user_id])
      @display_bottom = true

      if @event.users.include?(@current_user)
        @display_bottom = false
      end

      @participants = []
      if participations

        participations.each do |participation|
          @participants << User.find(participation.user_id)

        end
      end
    else
     redirect_to login_path
     flash.now[:danger] = 'connect before create an event'
   end

  end

  def create
    @current_user ||= User.find_by(id: session[:user_id])
    event = Event.new(event_params)
    if event.save
      @current_user.events << event
      event.users << @current_user
      redirect_to user_path(@current_user)
      Creation.create(user_id:@current_user, event_id:event)
    else
      render 'new'
    end

  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:description, :date, :place)
  end

end
