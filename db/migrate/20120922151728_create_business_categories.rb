class CreateBusinessCategories < ActiveRecord::Migration
  def up
    create_table(:categories) do |t|
      t.string :name

      t.timestamps
    end

    create_table(:business_categories, :id => false) do |t|
      t.references :business
      t.references :category
    end

    add_index(:categories, :name)
    add_index(:business_categories, [ :business_id, :category_id ])
    
  end
  
  def down
    drop_table :categories
    drop_table :business_categories
  end
end
