ActiveAdmin.register CampaignTask do
  menu :parent => "Campaign", :if => proc{ can?(:manage, CampaignTask) } 
                       
  controller.authorize_resource
  
  filter :task_name
  filter :working_status, :as => :select, :collection => ["new","in progress","draft","revision","completed","cancel"]
  filter :completed_date
  
  index do                            
    column("Order ID") { |task| link_to("#{task.order_id}", admin_order_path(task.order_id) )  }
    column("Staff Email") {|task| AdminUser.find_by_id(task.staff_id).email }                     
    column :title   
    column :task_name        
    column :working_status
    column :target_date   
    column :completed_date
    column :created_at
    default_actions                   
  end
  
  form do |f|                         
    f.inputs "Task Details" do
      f.input :order_id, :label => "Order ID", :as => :select,      :collection => Hash[Order.all.map{|b| [b.id, b.id]}]
      f.input :staff_id, :label => "Assign To", :as => :select,      :collection => Hash[AdminUser.with_role("Campaign Officer").all.map{|a| [a.email,a.id]}]  
      f.input :title
      f.input :task_name             
      if f.object.new_record?
        f.input :target_date, :label => "Target Finish Date",  :as => :datepicker
      else
        f.input :working_status, :as => :select,  :collection => ["new", "in progress", "draft", "revision", "completed", "cancel"]  
        f.input :completed_date,  :as => :datepicker
      end
    end                               
    f.buttons                         
  end
  
  show do |task|
    attributes_table do
      row "Order ID" do
        task.order.id
      end 
      row "Assign To" do
        AdminUser.find_by_id(task.staff_id).email
      end
      row "Title" do
        task.title
      end
      row "Task Name" do
        raw task.task_name.gsub(/\n/, '<br/>')
      end
      row :working_status
      row :target_date
      row :completed_date        
      row :created_at
    end
    active_admin_comments
  end
  
end
