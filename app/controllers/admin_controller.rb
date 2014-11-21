class AdminController < ApplicationController
  def index
    render('questions/index')
  end
end
