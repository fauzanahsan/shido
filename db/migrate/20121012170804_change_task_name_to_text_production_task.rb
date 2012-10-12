class ChangeTaskNameToTextProductionTask < ActiveRecord::Migration
  def up
    remove_column :production_tasks, :task_name
    add_column :production_tasks, :task_name,  :text, :default => "", :null => false
  end

  def down
    remove_column :production_tasks, :task_name
    add_column :production_tasks, :task_name,  :string, :default => "", :null => false
  end
end
