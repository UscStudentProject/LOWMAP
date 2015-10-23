class CommentsController < ApplicationController
	def new
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.new
	end
	
	def edit
	end
	
	def create
	   @blog = Blog.find(params[:blog_id])
	   @comment = @blog.comments.build(comment_params)
	
	   if @comment.save
	     redirect_to blog_path(@blog), notice: "新增回應成功！"
	   else
	     render :new
	   end
	end
	
	def update
	end
	
	def destroy
	end

	private	

	def comment_params
  	params.require(:comment).permit(:content)
	end
end
