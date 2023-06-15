class AddStudyTimeToAchievement < ActiveRecord::Migration[7.0]
  def change
    add_column :achievements, :studytime, :integer
  end
end
