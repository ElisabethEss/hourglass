class CreateUserAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :user_achievements do |t|
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
