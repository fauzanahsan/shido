ActiveAdmin.register City do
  menu :parent => "Location", :if => proc { can?(:manage, City) } 
  controller.authorize_resource
  
  form do |f|                         
    f.inputs "City Details" do
      f.input :region_id, :as => :select,      :collection => Hash[Region.all.map{|r| [r.region_name,r.id]}]   
      f.input :city_name
    end                               
    f.buttons                         
  end
  
end
