class AddRolesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string, default: "editor"
  end
end
