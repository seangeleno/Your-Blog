class BlogsController < ApplicationController
	include SessionsHelper
	def index
		@blogs = Blog.all
	end

	def show
		@blog = Blog.find( params[ :id ] )
	end

	def new
		@user = User.find( current_user[ :id ] )
		@blog = @user.blogs.new
	end

	def create
		@user = User.find( current_user[ :id ] )
		@blog = @user.blogs.new( blog_params )

		if @blog.save
			redirect_to user_path( :id )
		else
			render :new
		end
	end

	def edit
		@user = User.find( current_user[ :id ] )
		@blog = Blog.find( params[ :id ] )
	end

	def update
		@blog = Blog.find( params[ :id ] )
		if @blog.update_attributes( blog_params )
			redirect_to user_path( :id )
		else
			render :edit
		end
	end

	def destroy
		@blog = Blog.find( params[ :id ] )
		@blog.destroy
		redirect_to user_path( :id )
	end

	private
	def blog_params
		params.require( :blog ).permit( :title , :post )
	end

end
