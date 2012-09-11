class CreateWebPackageOrders < ActiveRecord::Migration
  def self.up
    create_table :web_package_orders do |t|
      t.references :order
      t.references :web_package
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :web_package_orders
  end
end
