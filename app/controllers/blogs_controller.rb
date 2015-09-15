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

	def edit
		@blog = Blog.find( params[ :id ] )
	end

	def create
		@user = User.find( current_user[ :id ] )
		@blog = @user.blogs.new( params.require( :blog ).permit( :title , :post ) )

		if @blog.save
			redirect_to user_path( current_user.id )
		else
			render :new
		end
	end

	def update
		if @blog.update_attributes( params.require( :blog ).permit( :title , :post ) )
			redirect_to user_path
		else
			render :edit
		end
	end

	def destroy
		@blog = Blog.find( params[ :id ] )
		@blog.destroy
		redirect_to blogs_path
	end

end
