class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string   :sales_id          , :default => '', :null => false
      t.string   :user_id           , :default => '', :null => false
      #"ENUM('new','pending','paid','cancel', 'problem')"
      t.string   :sales_status      , :default => '', :null => false
      t.column   :order_date        , :datetime 
      t.column   :fee               , :bigint, :default => 0
      
      t.timestamps
    end
    add_index :orders, :sales_id
    add_index :orders, :user_id
  end
  
  def down
    drop_table :orders
  end
end
