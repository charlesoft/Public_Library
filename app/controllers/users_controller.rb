class UsersController < ApplicationController

	
	before_action :set_user, :only => [:edit, :update, :destroy]

	# GET /users
	# GET /users.json(later)
	def index
		@users = User.all
	end

	#GET /users/user_id
	#GET /users/user_id.json(later)
	def new
		@user = User.new

	end

	#POST /users
	#POST /uses.json(later)
	def create

		@user = User.create(user_params)

		if @user.save
			flash[:notice] = "User was successfully created!"
			redirect_to users_path
		else
			flash[:notice] = "Please insert the data correctly"
			render :action => :new


	end

	#GET /users/new
	def edit
		
	end


	#PATCH/PUT /users/user_id
	#PATCH/PUT /users/user_id.json(later)
	def update
		if @user.update(user_params)
			flash[:notice] = "User was successfully updated!"
			redirect_to user_path(@user)

		else
			flash[:notice] = "Please change the date correctly"
			render :action => :edit
		
	end

	

	def show

	end

	#DELETE /user/user_id
	#DELETE /user/user_id.json(later)
	def destroy
		@user.destroy
		redirect_to users_path

	end

	def user_params
		params.require(:user).permit(:name, :address)
	end

	def set_user
		@user = User.find(params[:id])
	end

end