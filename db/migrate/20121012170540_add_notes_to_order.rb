class AddNotesToOrder < ActiveRecord::Migration
  def up
    add_column :orders, :notes,  :text, :default => ""
  end
  
  def down
    remove_column :orders, :notes
  end
end
