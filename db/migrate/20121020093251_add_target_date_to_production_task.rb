class AddTargetDateToProductionTask < ActiveRecord::Migration
  def up
    add_column :production_tasks, :target_date,  :datetime
  end
  
  def down
    remove_column :production_tasks, :target_date
  end
end
