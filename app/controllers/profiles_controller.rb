class ProfilesController < ApplicationController
  def index
    @total_experience = current_user.profile.total_study_time
    @total_study_hours = current_user.profile.total_study_time / 60 / 60
    @total_study_minutes = current_user.profile.total_study_time / 60 % 60
    @total_break_hours = current_user.profile.total_break_time / 60 / 60
    @total_break_minutes = current_user.profile.total_break_time / 60 % 60

    # @level = {
    #   "1" => 0,
    #   "2" => 1500,
    #   "3" => 4500,
    #   "4" => 8100,
    #   "5" => 124_20,
    #   "6" => 176_04,
    #   "7" => 238_24,
    #   "8" => 312_88,
    #   "9" => 402_44,
    #   "10" => 509_91
    # }

    # @current_level = 1
    # if @total_time > 1500 && @total_time < 3000
    #   @current_level = 2
    # elsif @total_time > 3000 && @total_time < 3600
    #   @current_level = 3
    # end

    #7900 3.34
    # @total_experience = current_user.experience
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

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    current_user.destroy
    redirect_to new_user_session_path, notice: "Account has been deleted"
  end
end
