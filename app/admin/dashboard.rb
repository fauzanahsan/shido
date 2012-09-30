#ActiveAdmin.register_page "Dashboard" do
ActiveAdmin::Dashboards.build do
  #menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") } #, :if => proc{ current_admin_user.has_role? ("Admin") }

  # content :title => proc{ I18n.t("active_admin.dashboard") } do
  #     div :class => "blank_slate_container", :id => "dashboard_default_message" do
  #       span :class => "blank_slate" do
  #         span "Welcome to Active Admin. This is the default dashboard page."
  #         small "To add dashboard sections, checkout 'app/admin/dashboards.rb'"
  #       end
  #     end
  
  
  section "Sales Stats" do
    #h1 :title => "Sales stats" do end  
    @staffs = AdminUser.with_role("Sales").all
    table do   
      th do 'Email' end
      th do 'Sales Count' end
      th do 'New' end
      th do 'Pending' end
      th do 'Paid' end
      th do 'Problem' end
      th do 'Cancel' end
    
      @staffs.each do |staff|
        tr do
          td do 
            staff.email 
          end
          
          td do 
            Order.where(:sales_id => staff.id).count
          end
          
          td do 
            Order.where(:sales_id => staff.id, :sales_status => "new").count
          end
          
          td do 
            Order.where(:sales_id => staff.id, :sales_status => "pending").count
          end
          
          td do 
            Order.where(:sales_id => staff.id, :sales_status => "paid").count
          end
          
          td do 
            Order.where(:sales_id => staff.id, :sales_status => "problem").count
          end
          
          td do 
            Order.where(:sales_id => staff.id, :sales_status => "cancel").count
          end   
        end
      end
    end              
  end
  
  section "Account Manager Stats" do
    @staffs = AdminUser.with_role("Account Manager").all
    table do
      th do 'Email' end
      th do 'Business Count' end
      
      @staffs.each do |staff|
        tr do
          td do staff.email end
          td do Business.where(:account_manager_id => staff.id).count end 
        end
      end 
    end
  end
  
  # end
end
