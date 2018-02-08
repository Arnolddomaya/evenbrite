class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end


  def create
  	@user = User.new(user_params)
		if @user.save
			redirect_to @user
		else
      render 'new'
		end
  end

  def show
		@user = User.find(params[:id])
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

	def edit
		@user = User.find(params[:id])
	end

	def update
	  @user = User.find(params[:id])

		if @user.update(user_params)
		 redirect_to @user
		 else render 'edit'
		end
	end


	def destroy
		@user= User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	private
  def user_params
    params.require(:user).permit(:name)
  end

end
