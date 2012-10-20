class AddTitleToProductionTask < ActiveRecord::Migration
  def up
    add_column :production_tasks, :title,  :string, :default => ""
  end
  
  def down
    remove_column :production_tasks, :title
  end
  
end
