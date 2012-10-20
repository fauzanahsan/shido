ActiveAdmin.register ProductionTaskPhoto do
  menu false
 
  controller.authorize_resource
  
  form(:html => { :multipart => true }) do |f| 
    f.inputs do
      if params[:task_id]
        f.input :production_task_id, :as => :hidden, :input_html => { :value => params[:task_id] } 
        #f.input :production_task_id, :input_html => { :value => params[:task_id] }
      end
      f.input :name
      f.input :image, :as => :file
    end
    
    f.buttons   
                         
  end
                                      
end                                   
