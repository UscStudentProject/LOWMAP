class BlogsController < ApplicationController
	before_action :find_blog, except: [:index]
	before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
	def index
		@blogs = Blog.all
	end

	def show
		@comments = @blog.comments
	end

	def new
		@blog = Blog.new
	end
	 
	def edit
		
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
		

		if @blog.update(blog_params)
		  redirect_to blogs_path, notice: "修改文章成功"
		else
		  render :edit
		end
	end

	def destroy
		
		@blog.destroy
		redirect_to blogs_path, alert: "文章已刪除"
	end

	private
	
	def blog_params 
	  params.require(:blog).permit(:title, :categroies, :content)
	end

	def find_blog
      @blog = Blog.find(params[:id])
  	end  
end
