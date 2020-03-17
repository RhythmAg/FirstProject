module ApplicationHelper
	def set_object
		@obj = params[:controller] == "news" ? News.find(params[:id]) : Article.find(params[:id])
	end

  def notification_list
    @notifications = current_user.notifications.order(created_at: :desc)
  end

end
