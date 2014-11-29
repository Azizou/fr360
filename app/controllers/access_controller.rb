class AccessController < ApplicationController
  layout 'public'
  def index
  end

  def login
    #login form
  end

  def attempt_login
    @user_found = User.find_by(email: params[:email])
    if @user_found
      session[:user_id] = @user_found[:user_id]
      redirect_to controller: 'users', action: 'index'
    else
      redirect_to action: 'login'
    end
  end

end
