class RemoveLevelToProfile < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :level, :integer
    add_reference :profiles, :level, foreign_key: true
  end
end
