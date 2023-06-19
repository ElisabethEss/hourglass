class CreateLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :levels do |t|
      t.integer :level
      t.integer :experience

      t.timestamps
    end
  end
end
