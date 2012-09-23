class AddBizInfoToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :biz_name,  :string, :default => ""
    add_column :businesses, :products_services,  :text, :default => ""
  end
  
  def down
    remove_column :businesses, :biz_name
    remove_column :businesses, :products_services
  end
end
