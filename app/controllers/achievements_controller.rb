class AchievementsController < ApplicationController
  def index
    @achievements = Achievement.all
    @total_time = current_user.profile.total_study_time
  end
end
