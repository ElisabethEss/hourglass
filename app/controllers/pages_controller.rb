class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    # @image = current_user.profile.avatars.first
    @total_experience = current_user.profile.total_study_time
    @total_study_hours = current_user.profile.total_study_time / 60 / 60
    @total_study_minutes = current_user.profile.total_study_time / 60 % 60
    @total_break_hours = current_user.profile.total_break_time / 60 / 60
    @total_break_minutes = current_user.profile.total_break_time / 60 % 60

    if user_signed_in?
      @level = current_user.level
    end

    @current_level = 1

    case @total_experience
    when 0...1500
      @current_level = 2
    when 1500...4500
      @current_level = 3
    when 4500...8100
      @current_level = 4
    when 8100...12_420
      @current_level = 5
    when 12_420...17_604
      @current_level = 6
    when 17_604...238_24
      @current_level = 7
    when 238_24...312_88
      @current_level = 8
    when 312_88...402_44
      @current_level = 9
    when 402_44...509_91
      @current_level = 10
    when 509_91...638_87
      @current_level = 11
    when 638_87...793_62
      @current_level = 12
    end
  end

  def update_study_time
    # @profile = Profile.find(params[:profile_id])
    # we dont need this because we are loged in as current_user
    # BUT: I don't just to update, I want to add!
    current_user.profile.update(total_study_time: current_user.profile.total_study_time + params[:time].to_i)
    current_user.profile.update(experience: current_user.profile.experience + params[:time].to_i)
  end

  def update_break_time
    # @profile = Profile.find(params[:profile_id])
    # we dont need this because we are loged in as current_user
    # BUT: I don't just to update, I want to add!
    current_user.profile.update(total_break_time: current_user.profile.total_break_time + params[:time].to_i)
  end

end
