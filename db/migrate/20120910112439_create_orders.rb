class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string   :staff_id          , :default => '', :null => false
      t.column   :sales_status      , "ENUM('new','pending','paid','cancel', 'problem')"
      t.column   :working_status    , "ENUM('new','in progress','draft','revision','completed','cancel')"
      
      
      t.timestamps
    end
  end
  
  def down
    drop_table :orders
  end
end
