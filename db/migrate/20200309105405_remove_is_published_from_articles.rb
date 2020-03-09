class RemoveIsPublishedFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :is_published, :boolean
  end
end
