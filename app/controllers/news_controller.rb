class NewsController < ApplicationController
	before_action :set_news, only: [:show]

	def index
		@news = News.all
	end

	def show
	end

	private

	 	def set_news
	 		@news = News.find(params[:id])
	 	end

	 	def news_params
      params.require(:news).permit(:title, :description)
    end

end