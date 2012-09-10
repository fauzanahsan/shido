class CreateProductionTasks < ActiveRecord::Migration
  def change
    create_table :production_tasks do |t|
      t.string   :staff_id          , :default => '', :null => false
      t.string   :order_id          , :default => '', :null => false
      t.string   :task_name         , :default => '', :null => false
      t.column   :working_status    , "ENUM('new','in progress','draft','revision','completed','cancel')"
      t.column   :completed_date    , :datetime 
      
      t.timestamps
    end
    add_index :production_tasks, :order_id
    add_index :production_tasks, :staff_id
  end
  
  def down
    drop_table :production_tasks
  end
end
