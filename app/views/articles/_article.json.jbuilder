binding.pry
json.extract! article, :id, :name, :description, :created_at, :updated_at
json.url article_url(article, format: :json)
