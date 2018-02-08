class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(name: params[:session][:name])
    p user
    if user
      log_in user
      redirect_to user
      #redirect_to "/images/screenshot.jpg"
    else
      flash.now[:danger] = 'Id not exit'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
