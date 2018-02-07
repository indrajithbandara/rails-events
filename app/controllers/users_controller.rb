class UsersController < ApplicationController

	def create
		@user = User.new(user_params)
    if @user.save
    	flash[:success] = "Registration successfull"
      redirect_to root_path
    else
    	flash.now[:danger] = @user.errors.full_messages.to_sentence
      render 'new'
    end
	end

	def new
		@user = User.new
	end

	private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end

end
