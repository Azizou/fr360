class HomeController < ApplicationController
  def home
  end
  def index
    @user = User.new
    render 'home'
  end

  def help
  end

  def contact_us
  end

  def about
  end
end
