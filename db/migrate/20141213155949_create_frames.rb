class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.string :name
      t.integer :duration
      t.integer :user_id
      t.integer :ecomic_id

      t.timestamps
    end
  end
end
