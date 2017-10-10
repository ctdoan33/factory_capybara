class UsersController < ApplicationController
	def new
	end
	def create
		@user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
		if @user.save
			flash[:notice] = ['User successfully created']
			redirect_to user_path(User.last)
		else
			flash[:notice] = @user.errors.full_messages
			redirect_to new_user_path
		end
	end
	def show
		@user = User.find(params[:id])
	end
end
