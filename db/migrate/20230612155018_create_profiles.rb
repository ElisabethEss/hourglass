class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :total_study_time
      t.integer :total_break_time
      t.integer :experience
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
