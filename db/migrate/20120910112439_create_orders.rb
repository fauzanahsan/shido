class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string   :sales_id          , :default => '', :null => false
      t.column   :sales_status      , "ENUM('new','pending','paid','cancel', 'problem')"
      t.column   :order_date        , :datetime 
      t.column   :fee               , :bigint, :default => 0
      
      t.timestamps
    end
  end
  
  def down
    drop_table :orders
  end
end
