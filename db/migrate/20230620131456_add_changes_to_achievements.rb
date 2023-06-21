class AddChangesToAchievements < ActiveRecord::Migration[7.0]
  def change
    add_column :achievements, :story, :string
    add_column :achievements, :break_time, :integer, default: 0
  end
end
