class CreateProductionTasks < ActiveRecord::Migration
  def change
    create_table :production_tasks do |t|

      t.timestamps
    end
  end
end
