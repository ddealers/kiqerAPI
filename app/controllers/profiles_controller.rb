class ProfilesController < ApplicationController
# GET /profile
# GET /profile.json
  def show
    @profile = Profile.find(params[:user_id])
    render json: @profile
  end

end