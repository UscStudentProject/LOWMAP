class Account::BlogsController < ApplicationController
	before_action :authenticate_user!

	def index
  		@blogs = current_user.blogs.order("updated_at DESC")
	end
end
