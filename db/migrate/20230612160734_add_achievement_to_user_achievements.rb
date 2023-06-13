class AddAchievementToUserAchievements < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_achievements, :achievement, foreign_key: true
  end
end
