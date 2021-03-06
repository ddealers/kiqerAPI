class UsersController < ApplicationController
	# GET /users
	# GET /users.json
	def index
		@users = User.all

		render json: @users
	end

	# GET /users/1
	# GET /users/1.json
	def show
		@user = User.find(params[:id])

		render json: @user
	end

	# POST /users
	# POST /users.json
	def create
		@user = User.new(user_params)

		if @user.save
			render json: @user, status: :created, location: @user
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end

	# PATCH/PUT /users/1
	# PATCH/PUT /users/1.json
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			render :text => true
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end

	# DELETE /users/1
	# DELETE /users/1.json
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		head :no_content
	end

	# POST  /users/login
	def login
		@user = User.find_by(email: params[:email])
    	if @user && @user.authenticate(params[:password])
    		render json: @user.id
    	else
    		render :text => false
    	end
	end

	# POST /kiqs/1/find/2
	# POST /kiqs/1/find/2.json
	def find
		@kiq = Kiq.where({follow: params[:user_id], follower: params[:id]})
 		
 		if @kiq.blank?
 			render :text => false
		else
			render :text => true
		end
	end


	private

	def user_params
		params.require(:user).permit(:name, :password, :email, :tipo, :fbid)
	end

end