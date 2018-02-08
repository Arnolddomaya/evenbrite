class CreationsController < ApplicationController
  def new
    @current_user ||= User.find_by(id: session[:user_id])
    user = @current_user
    unless user
      flash.now[:danger] = 'connect before create an event'
      redirect_to login_path
    end
    @creation = user.creations.new
    @my_event = Event.new
    @my_event.save
    @creation.event = @my_event
  end




end
