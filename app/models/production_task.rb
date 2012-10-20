class ProductionTask < ActiveRecord::Base
  belongs_to :order
  
  attr_accessible :staff_id, :task_name, :working_status, :completed_date, :order_id, :title, :production_task_photos, :as => :admin
  
  has_many :production_task_photos
  accepts_nested_attributes_for :production_task_photos
  # def task_name_html
  #     self.task_name.to_html
  #   end
end
