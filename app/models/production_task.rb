class ProductionTask < ActiveRecord::Base
  belongs_to :order
  
  attr_accessible :staff_id, :task_name, :working_status, :completed_date, :order_id, :title, :production_task_photos,
                  :target_date, :as => :admin
  
  has_many :production_task_photos
  accepts_nested_attributes_for :production_task_photos
  
  after_create :set_working_status
  
  def set_working_status
    self.working_status = "new"
    save
  end
  
end
