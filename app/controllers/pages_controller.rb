class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def update_study_time
    # @profile = Profile.find(params[:profile_id])
    # we dont need this because we are loged in as current_user

    # BUT: I don't just to update, I want to add!
    current_user.profile.update(total_study_time: current_user.profile.total_study_time + params[:time].to_i) # can I call on storeTime?
    # respond_to do |format|
    #   if current_user.profile.update(total_study_time: current_user.profile.total_study_time + params[:time].to_i) # can I call on storeTime?
    #     format.text{ "yes" } # Follow the classic Rails flow and look for a create.json view
    #   else
    #     # format.html { render "restaurants/show", status: :unprocessable_entity }
    #     # format.json # Follow the classic Rails flow and look for a create.json view
    #     format.text{ "no" }
    #   end
    # end
  end
end
