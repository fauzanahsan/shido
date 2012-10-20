class ProductionTask < ActiveRecord::Base
  belongs_to :order
  
  attr_accessible :staff_id, :task_name, :working_status, :completed_date, :order_id, :title, :as => :admin
  
  # def task_name_html
  #     self.task_name.to_html
  #   end
end
