class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.integer :current_session_time
      t.string :session_type
      t.integer :duration
      t.datetime :start_time
      t.string :task
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
