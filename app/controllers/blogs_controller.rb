class BlogsController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :update, :destroy]
	def index
		@blogs = Blog.all
	end

	def show
		@blog = Blog.find(params[:id])
		@comments = @blog.comments
	end

	def new
		@blog = current_user.blogs.new
	end
	 
	def edit
		@blog = current_user.blogs.find(params[:id])
	end

	def create
		@blog = current_user.blogs.new(blog_params)

		if @blog.save
		  redirect_to blogs_path
		else
		  render :new
		end
	end

	def update
		@blog = current_user.blogs.find(params[:id])

		if @blog.update(blog_params)
		  redirect_to blog_path, notice: "修改文章成功"
		else
		  render :edit
		end
	end

	def destroy
		@blog = current_user.blogs.find(params[:id])
		@blog.destroy
		redirect_to blogs_path, alert: "文章已刪除"
	end

	private
	
	def blog_params 
	  params.require(:blog).permit(:title, :categroies, :content)
	end

end
