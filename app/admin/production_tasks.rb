ActiveAdmin.register ProductionTask do
  menu :parent => "Production", :if => proc{ can?(:manage, ProductionTask) } 
  controller.authorize_resource
  
  filter :task_name
  filter :working_status, :as => :select, :collection => ["new","in progress","draft","revision","completed","cancel"]
  filter :completed_date
  
  index do                            
    column :order_id
    column("Staff Email") {|task| AdminUser.find_by_id(task.staff_id).email }                     
    column :task_name        
    column :working_status
    column :updated_at           
    column :created_at
    column :completed_date            
    default_actions                   
  end
  
  form do |f|                         
    f.inputs "Task Details" do
      f.input :order_id, :label => "Order ID", :as => :select,      :collection => Hash[Order.all.map{|b| [b.id, b.id]}]
      f.input :staff_id, :label => "Staff Email", :as => :select,      :collection => Hash[AdminUser.all.map{|a| [a.email,a.id]}]  
      f.input :task_name
      f.input :working_status, :as => :select,  :collection => ["new", "in progress", "draft", "revision", "completed", "cancel"]               
      f.input :completed_date, :as => :date_select
    end                               
    f.buttons                         
  end
  
end
