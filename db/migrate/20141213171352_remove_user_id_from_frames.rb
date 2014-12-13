class RemoveUserIdFromFrames < ActiveRecord::Migration
  def change
    remove_column :frames, :user_id

  end
end
