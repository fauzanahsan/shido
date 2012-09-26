class BusinessPhotosController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @business_photo = BusinessPhoto.new(:business_id => params[:profile_id])
  end

  def create
    @business_photo = BusinessPhoto.new(params[:business_photo])
    if @business_photo.save
      flash[:notice] = "Successfully created"
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  # def edit
  #     @painting = Painting.find(params[:id])
  #   end
  # 
  #   def update
  #     @painting = Painting.find(params[:id])
  #     if @painting.update_attributes(params[:painting])
  #       flash[:notice] = "Successfully updated painting."
  #       redirect_to @painting.gallery
  #     else
  #       render :action => 'edit'
  #     end
  #   end
  # 
  #   def destroy
  #     @painting = Painting.find(params[:id])
  #     @painting.destroy
  #     flash[:notice] = "Successfully destroyed painting."
  #     redirect_to @painting.gallery
  #   end
end
