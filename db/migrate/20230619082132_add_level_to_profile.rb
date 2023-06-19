class AddLevelToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :level, :integer, default: 1
  end
end
