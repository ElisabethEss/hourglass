class AddStoryToAvatars < ActiveRecord::Migration[7.0]
  def change
    add_column :avatars, :story, :text
  end
end
