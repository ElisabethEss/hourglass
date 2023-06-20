class ChangeDefaultOfProfile < ActiveRecord::Migration[7.0]
  def change
    change_column_default :profiles, :experience, 1
  end
end
