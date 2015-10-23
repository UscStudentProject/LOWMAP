class CommentsController < ApplicationController
	before_action :find_blog
	before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
	def new
		@comment = @blog.comments.new
	end
	
	def edit
		@comment = current_user.comments.find(params[:id])
	end
	
	def create
		@comment = @blog.comments.build(comment_params)
		@comment.author = current_user
	
	   if @comment.save
	     redirect_to blog_path(@blog), notice: "新增回應成功！"
	   else
	     render :new
	   end
	end
	
	def update
	   @comment = current_user.comments.find(params[:id])
	
	   if @comment.update(comment_params)
	     redirect_to blog_path(@blog), notice: "回應修改成功！"
	   else
	     render :edit
	   end
	end
	
	def destroy
	   @comment = current_user.comments.find(params[:id])
	
	   @comment.destroy
	   redirect_to blog_path(@blog), alert: "回應已刪除"
	end

	private	

	def comment_params
  	params.require(:comment).permit(:content)
	end

	def find_blog
      @blog = Blog.find(params[:blog_id])
  	end  
end
