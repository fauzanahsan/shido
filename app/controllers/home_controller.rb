class HomeController < ApplicationController
  #before_filter :authenticate_user!
  
  def index
    if user_signed_in? 
      render 'dashboard/index'
    end 
  end
  
end
