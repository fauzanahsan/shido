class ProductionTaskPhoto < ActiveRecord::Base
  belongs_to :production_task, :polymorphic => true
  attr_accessible :production_task_id, :name, :image, :as => :admin 
  mount_uploader :image, DocumentUploader
  
end
