class PostsController < ApplicationController


	def index
		@posts = Post.all.order(created_at: :desc)
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
			flash[:success] = "Post created"
		else
			redirect_to "new"
		end
	end






	private

		def post_params
			params.require(:post).permit(:title, :body)
		end

end
