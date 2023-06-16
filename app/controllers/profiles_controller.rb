class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    # @user = current_user
  end
end
