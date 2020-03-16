class CommentsController < ApplicationController
	before_action :set_value, only: [:create, :destroy]

	def index
		@comments = current_user.comments.paginate(page: params[:page], per_page: 5)
	end

	def create
		@comment = @object.comments.create(comment_params)		
		@comment.user_id ||= current_user.id
		@comment.save
		redirect_to(@object)
	end

	def destroy
    @comment = @object.comments.find(params[:id])
    @comment.destroy
    redirect_to (@object)
	end

	private

		def set_value
			@object = params[:article_id].present? ? Article.find(params[:article_id]) : News.find(params[:news_id])
		end
		
		def comment_params
			params.require(:comment).permit(:commenter, :body, :user_id)
		end	
end