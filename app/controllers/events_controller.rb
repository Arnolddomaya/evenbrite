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
    @events = Event.all
  end


  def show
    if session[:user_id]
      @event = Event.find(params[:id])
      creation = Creation.find_by(event_id: @event.id)
      @event_creator = creation.user
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
      redirect_to user_path(@current_user)
      Creation.create(user_id:@current_user, event_id:event)
    else
      render 'new'
    end

  end



  private
  def event_params
    params.require(:event).permit(:description, :date, :place)
  end

end
