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
      f.input :staff_id, :label => "Assign To", :as => :select,      :collection => Hash[AdminUser.with_role("Web Officer").all.map{|a| [a.email,a.id]}]  
      f.input :task_name
      f.input :working_status, :as => :select,  :collection => ["new", "in progress", "draft", "revision", "completed", "cancel"]               
      f.input :completed_date,  :as => :datepicker #:as => :datetime_picker, :input_html => { :placeholder => "YYYY-MM-DD HH:MM", :size => 30 } #:as => :datetime_picker, :input_html => { :size => 20 }
    end                               
    f.buttons                         
  end
  
end
