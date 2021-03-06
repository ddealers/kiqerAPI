class ProfilesController < ApplicationController
	# GET /profile
	# GET /profile.json
	def show
		@profile = Profile.where(user_id: params[:user_id]).take
		render json: @profile, status: :ok
	end

	# POST /profile/create
	# POST /profile/create.json
	def create
		@profile = Profile.where(user_id: params[:user_id]).take
		if @profile
			if @profile.update(profile_params)
				render json: @profile, status: 'updated'
			else
				render json: @profile.errors, status: :unprocessable_entity
			end
		else
			@profile = Profile.new(profile_params)
			if params[:user_id].present?
				@profile.user = User.find(params[:user_id])
				if @profile.save
					render json: @profile, status: :created
				else
					render json: @profile.errors, status: :unprocessable_entity
				end
			else
				render json: @profile.errors, status: :unprocessable_entity
			end
		end
	end

	# PATCH/PUT /profile/1
	# PATCH/PUT /profile/1.json
	def update
		@profile = Profile.where(user_id: params[:user_id]).take
		if @profile.update(profile_params)
			render json: @profile, status: 'updated'
		else
			render json: @profile.errors, status: :unprocessable_entity
		end
	end

	private

	def profile_params
		params.require(:profile).permit(:name, :surname, :birth, :country, :location)
	end
end
