class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.text :message
      t.datetime "created_at", null: false
     	t.datetime "updated_at", null: false
    end
  end
end
