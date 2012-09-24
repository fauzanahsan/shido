class BusinessPhoto < ActiveRecord::Base
  attr_accessible :business_id, :name, :image
  belongs_to :business
  mount_uploader :image, ImageUploader
end
