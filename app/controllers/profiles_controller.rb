class ProfilesController < ApplicationController
  def show
    @business = Business.find_by_biz_name(params[:id])
    @json = @business.to_gmaps4rails
  end

end
