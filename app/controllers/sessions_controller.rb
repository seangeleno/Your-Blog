class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by( email: params[ :login ][ :email ] )
    if user && user.authentication( params[ :login ][ :password ] )
      session[ :user_id ] = user.id.to_s
      redirect_to blogs_path
    else
      render :new
    end
  end
  def destroy
    session.delete( :user_id )
    redirect_to login_path
  end
end
