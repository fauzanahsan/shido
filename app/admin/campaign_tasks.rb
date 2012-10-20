ActiveAdmin.register CampaignTask do
  menu :parent => "Campaign", :if => proc{ can?(:manage, CampaignTask) } 
                       
  controller.authorize_resource
  
  filter :task_name
  filter :working_status, :as => :select, :collection => ["new","in progress","draft","revision","completed","cancel"]
  filter :completed_date
  
  index do                            
    column :order_id
    column("Staff Email") {|task| AdminUser.find_by_id(task.staff_id).email }                     
    column :title   
    column :task_name        
    column :working_status
    column :updated_at           
    column :created_at
    default_actions                   
  end
  
  form do |f|                         
    f.inputs "Task Details" do
      f.input :order_id, :label => "Order ID", :as => :select,      :collection => Hash[Order.all.map{|b| [b.id, b.id]}]
      f.input :staff_id, :label => "Assign To", :as => :select,      :collection => Hash[AdminUser.with_role("Campaign Officer").all.map{|a| [a.email,a.id]}]  
      f.input :title
      f.input :task_name
      f.input :working_status, :as => :select,  :collection => ["new", "in progress", "draft", "revision", "completed", "cancel"]               
      f.input :completed_date, :as => :datepicker
    end                               
    f.buttons                         
  end
  
  show do |task|
    attributes_table do
      row "Order ID" do
        task.id
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
      row :completed_date
      row :updated_at           
      row :created_at
    end
    active_admin_comments
  end
  
end
