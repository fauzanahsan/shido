ActiveAdmin.register ProductionTask do
  menu :parent => "Production", :if => proc{ can?(:manage, ProductionTask) } 
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
    column :updated_at           
    column :created_at
    column :completed_date            
    default_actions                   
  end
  
  form(:html => { :multipart => true }) do |f|                    
    f.inputs "Task Details" do
      f.input :order_id, :label => "Order ID", :as => :select,      :collection => Hash[Order.all.map{|b| [b.id, b.id]}]
      f.input :staff_id, :label => "Assign To", :as => :select,      :collection => Hash[AdminUser.with_role("Web Officer").all.map{|a| [a.email,a.id]}]  
      f.input :title
      f.input :task_name
      f.input :working_status, :as => :select,  :collection => ["new", "in progress", "draft", "revision", "completed", "cancel"]               
      f.input :completed_date,  :as => :datepicker #:as => :datetime_picker, :input_html => { :placeholder => "YYYY-MM-DD HH:MM", :size => 30 } #:as => :datetime_picker, :input_html => { :size => 20 }
    end
    
    # f.inputs "Image" do
    #       f.semantic_fields_for :production_task_photos do |s|
    #         #s.file_field :images
    #         s.input :image, :as => :file
    #       end
    #     end
                                     
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
      row :created_at
      
      row 'Production Task Images' do
        table_for task.production_task_photos do
          column("Link") { |task_photo| link_to File.basename(task_photo.image.path), "#{task_photo.image}" }  
        end
      end
      
      row ' ' do
        link_to("New Documents", new_admin_production_task_photo_path(:task_id => task.id), :method => :get, :class => "button")
      end
      
    end
    active_admin_comments
  end
  
end
