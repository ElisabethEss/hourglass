class AddMaxexpToLevel < ActiveRecord::Migration[7.0]
  def change
    add_column :levels, :max_experience, :integer
  end
end
