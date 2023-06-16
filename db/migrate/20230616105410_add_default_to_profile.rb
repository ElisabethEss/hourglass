class AddDefaultToProfile < ActiveRecord::Migration[7.0]
  def change
    change_column_default :profiles, :total_study_time, 0
    change_column_default :profiles, :total_break_time, 0
    change_column_default :profiles, :experience, 0
  end
end
