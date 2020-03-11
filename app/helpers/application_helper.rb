module ApplicationHelper
	def set_object
		@obj = params[:controller] == "news" ? News.find(params[:id]) : Article.find(params[:id])
	end

end
