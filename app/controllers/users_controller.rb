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

  def edit
    @user = User.find(params[:id])
  end

	def new
		@user = User.new
	end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your account was updated !"
      redirect_to edit_profile_path
    else
      flash.now[:danger] = @user.errors.full_messages.to_sentence
      render 'edit'
    end
  end

	private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation) 
  end

end
