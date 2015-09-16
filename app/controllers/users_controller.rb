class UsersController < ApplicationController
  include SessionsHelper
  def show
    if current_user
      @user = current_user
      @blog = @user.blogs
    else
      redirect_to login_path
    end
  end
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new( user_params )
    if @user.save
      session[ :user_id ] = @user.id.to_s
      redirect_to user_path( current_user.id )
    else
      render :new
    end
  end

  private
  def user_params
    params.require( :user ).permit( :name , :email , :avatar , :password , :password_confirmation )
  end
end
