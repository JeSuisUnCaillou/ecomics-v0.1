class CreateEcomics < ActiveRecord::Migration
  def change
    create_table :ecomics do |t|
      t.string :name
      t.string :description
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
