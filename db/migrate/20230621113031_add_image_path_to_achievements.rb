class AddImagePathToAchievements < ActiveRecord::Migration[7.0]
  def change
    add_column :achievements, :image_path, :string
  end
end
