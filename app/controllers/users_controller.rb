class UsersController < ApplicationController
  include SessionsHelper
  def index
    @users = User.all
  end
  def show
    @user = User.find( params[ :id ] )
    @blog = @user.blogs
  end
  def new
    @user = User.new
  end
  def edit
    @user = User.find( current_user[ :id ] )
  end
  def create
    @user = User.new( user_params )
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to user_path( :user_id )
    else
      render :new
    end
  end
  private
  def user_params
    params.require( :user ).permit( :name , :email , :avatar , :password , :password_confirmation )
  end
end
