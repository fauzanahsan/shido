class CreateProductionTasks < ActiveRecord::Migration
  def self.up
    create_table :production_tasks do |t|
      t.string   :staff_id          , :default => '', :null => false
      t.string   :order_id          , :default => '', :null => false
      t.string   :task_name         , :default => '', :null => false
      # "ENUM('new','in progress','draft','revision','completed','cancel')"
      t.string   :working_status    , :default => '', :null => false
      t.column   :completed_date    , :datetime 
      
      t.timestamps
    end
    add_index :production_tasks, :order_id
    add_index :production_tasks, :staff_id
  end
  
  def self.down
    drop_table :production_tasks
  end
end
