class BlogsController < ApplicationController
	include SessionsHelper

	def index
		@blogs = Blog.all
	end
	def new
		logged_user
		@blog = @user.blogs.new
	end
	def create
		logged_user
		keys = params.keys
		keys.each do |k|
			if k["blog"] === "blog"
				Blog.create({ title: params[ k ]["title"], post: params[ k ]["post"], user_id: current_user.id })
			end
		end
		render :index
	end
	def show
		logged_user
		@blog = Blog.find( params[ @user.id ] )
	end
	def edit
		logged_user
		@blog = Blog.find( params[ :id ] )
	end
	def update
		logged_user
		@blog = Blog.find( params[ :id ] )
		if @blog.update_attributes( blog_params )
			redirect_to user_path( @user.id )
		else
			render :edit
		end
	end
	def destroy
		logged_user
		@blog = Blog.find( params[ :id ] )
		@blog.destroy
		redirect_to user_path( @user.id )
	end

	private
	def blog_params
		params
	end
	def logged_user
		@user = User.find( current_user[ :id ] )
	end

end
