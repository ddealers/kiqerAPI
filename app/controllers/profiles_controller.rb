class ProfilesController < ApplicationController
	# GET /profile
	# GET /profile.json
	def show
		@profile = Profile.find(params[:user_id])
		render json: @profile
	end

	# POST /profile/create
	# POST /profile/create.json
	def create
		@profile = Profile.new(profile_params)
		@profile.user = User.find(params[:user_id])
		if params[:user_id].present?
			if @profile.save
				render json: @profile, status: :created
			else
				render json: @profile.errors, status: :unprocessable_entity
			end
		else
			render json: @profile.errors, status: :unprocessable_entity
		end
	end

	# PATCH/PUT /profile/1
	# PATCH/PUT /profile/1.json
	def update
		@profile = Profile.find(params[:id])
		if @profile.update(profile_params)
			head :no_content
		else
			render json: @profile.errors, status: :unprocessable_entity
		end
	end

	private

	def profile_params
		params.require(:user_id)
		params.require(:profile).permit(:name, :surname, :birth, :country)
	end
end
