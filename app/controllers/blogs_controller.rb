class BlogsController < ApplicationController
	def index
		@blogs = Blog.all
	end

	def show
		@blog = Blog.find(params[:id])
		@comments = @blog.comments
	end

	def new
		@blog = Blog.new
	end
	 
	def edit
		@blog = Blog.find(params[:id])
	end

	def create
		@blog = Blog.create(blog_params)

		if @blog.save
		  redirect_to blogs_path
		else
		  render :new
		end
	end

	def update
		@blog = Blog.find(params[:id])

		if @blog.update(blog_params)
		  redirect_to blogs_path, notice: "修改文章成功"
		else
		  render :edit
		end
	end

	def destroy
		@blog = Blog.find(params[:id])
		@blog.destroy
		redirect_to blogs_path, alert: "文章已刪除"
	end

	private
	
	def blog_params 
	  params.require(:blog).permit(:title, :categroies, :content)
	end
end
