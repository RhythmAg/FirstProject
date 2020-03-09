class CommentsController < ApplicationController
	before_action :set_article_value, only: [:create, :destroy]

	def index
		@comments = current_user.comments.paginate(page: params[:page], per_page: 5)
	end

	def create
		@comment = @article.comments.create(comment_params)
		redirect_to(@article)
	end

	def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to (@article)
	end

	private

		def set_article_value
			@article = Article.find(params[:article_id])
		end

		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end	
end