class RemoveUserAchievementFromAchievement < ActiveRecord::Migration[7.0]
  def change
    remove_reference :achievements, :user_achievement, foreign_key: true
  end
end
