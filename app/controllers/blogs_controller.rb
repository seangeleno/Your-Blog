class BlogsController < ApplicationController
	include SessionsHelper
	include BlogsHelper

	def index
		@blogs = Blog.all
	end
	def new
		logged_user
		@blog = @user.blogs.new
	end
	def create
		logged_user
		@blog = @user.blogs.new( blog_params )

	  if @blog.save
			redirect_to user_path( @user.id )
		else
			render :new
		end
	end
	def show
		logged_user
		@blog = Blog.find( params[ :id ] )
		@content = @blog.content
	end
	def edit
		logged_user
		@blog = Blog.find( params[ :id ] )
		@content = @blog.content
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
		params.require( :blog ).permit( :content )
	end
	def logged_user
		@user = User.find( current_user[ :id ] )
	end

end
