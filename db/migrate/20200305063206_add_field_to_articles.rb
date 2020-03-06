class AddFieldToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :email, :string
  end
end
