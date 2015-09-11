class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comments = Comment.find( params[ :id ] )
  end

  def new
    @blog = Blog.find( params[ :blog_id ] )
    @comment = @blog.comments.new
  end

  def edit
  end

  def create
    @blog = Blog.find( params[ :blog_id ] )
    @comment = @blog.comments.new( params.require( :comment ).permit( :commenter , :opinion ) )

    if @comment.save
      redirect_to @blog , notice: "Comment Was Successfully Saved"
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment , notice: "Comment Was Successfully Saved"
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find( params[ :id ] )
    @comment.destroy
    redirect_to blogs_path , notice: "Comment Was Successfully Destroyed"
  end

end