class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

	def create
		@user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
    	flash[:success] = "Registration successfull, you are logged in !"
      redirect_to root_path
    else
    	flash.now[:danger] = @user.errors.full_messages.to_sentence
      render 'new'
    end
	end

  # def edit
  # end

	def new
		@user = User.new
	end

  # def show
  # end

  # def update
  #   if @user.update(user_params)
  #     flash[:success] = "Your account was updated !"
  #     redirect_to edit_profile_path
  #   else
  #     flash.now[:danger] = @user.errors.full_messages.to_sentence
  #     render 'edit'
  #   end
  # end

	private

# Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  def user_params
    params.permit(:username, :email, :password, :password_confirmation) 
  end

end
