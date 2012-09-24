class ProfilesController < ApplicationController
  def show
    @business = Business.find_by_biz_name(params[:id])
  end

end
