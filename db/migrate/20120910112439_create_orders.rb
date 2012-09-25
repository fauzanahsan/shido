class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer   :sales_id          , :default => nil
      t.integer   :user_id           , :null => false
      t.integer   :account_manager_id           
      #"ENUM('new','pending','paid','cancel', 'problem')"
      t.string   :sales_status      , :default => '', :null => false
      t.column   :order_date        , :datetime 
      t.column   :fee               , :bigint, :default => 0
      
      t.timestamps
    end
    add_index :orders, :sales_id
    add_index :orders, :user_id
  end
  
  def self.down
    drop_table :orders
  end
end
