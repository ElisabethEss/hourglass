class AchievementsController < ApplicationController
  def index
    @achievements = Achievement.all
    @total_time = current_user.profile.total_study_time
    @breaktime = current_user.profile.total_break_time
  end
end
