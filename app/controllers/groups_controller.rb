class GroupsController < ApplicationController
	before_action :authenticate_user!, only: ["new, :edit, :create, :update, :destory"]
	def index
		flash[:notice] = "Good morning!"
		@groups = Group.all
	end

	def show
		@group = Group.find(params[:id])
		@posts = @group.posts
	end

	def new
		@group = Group.new	
	end

	def edit
		@group = current_user.groups.find(params[:id])
	end

	def create
		@group = current_user.groups.new(group_params)
	
	   if @group.save
	   	current_user.join!(@group)
	    redirect_to groups_path
	   else
	     render :new
	   end
	end

 	def update
	   @group = current_user.groups.find(params[:id])
	
	   if @group.update(group_params)
	     redirect_to groups_path, notice: "修改討論版成功"
	   else
	     render :edit
	   end
	end

	def destroy
		@group = current_user.groups.find(params[:id])
		@group.destroy
		redirect_to groups_path, alert: "討論板已刪除"
	end

	def join
		@group = Group.find(params[:id])

		if !current_user.is_member_of?(@group)
			current_user.join!(@group)
			flash[:notice] = "成功加入本討論版"
		else
			flash[:notice] = "你已經是本討論板成員了"
		end

		redirect_to group_path(@group)
	end

	def quit
		@group = Group.find(params[:id])

		if current_user.is_member_of?(@group)
			current_user.quit!(@group)
			flash[:alert] = "成功退出本討論版"
		else
			flash[:warning] = "你並不是本討論板成員"
		end

		redirect_to group_path(@group)
	end

	private

	def group_params 
	  params.require(:group).permit(:title, :description)
	end

end


