class AddPictureColumnsToFrames < ActiveRecord::Migration
  def self.up
    add_attachment :frames, :picture
  end

  def self.down
    remove_attachment :frames, :picture
  end
end
