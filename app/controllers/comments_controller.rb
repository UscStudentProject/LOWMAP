class CommentsController < ApplicationController
	def new
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.new
	end
	
	def edit
	end
	
	def create
	end
	
	def update
	end
	
	def destroy
	end
end
