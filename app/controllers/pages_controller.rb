class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    # @image = current_user.profile.avatars.first
  end

  def update_study_time
    # @profile = Profile.find(params[:profile_id])
    # we dont need this because we are loged in as current_user
    # BUT: I don't just to update, I want to add!
    current_user.profile.update(total_study_time: current_user.profile.total_study_time + params[:time].to_i)
  end

  def update_break_time
    # @profile = Profile.find(params[:profile_id])
    # we dont need this because we are loged in as current_user
    # BUT: I don't just to update, I want to add!
    current_user.profile.update(total_break_time: current_user.profile.total_break_time + params[:time].to_i)
  end

end
