class AddEntryCategories < ActiveRecord::Migration
  def self.up
    create_table :categories, :force => true do |t|
      t.string :name
      t.timestamps
    end
    
    ["Products", "Services", "Natural Phenomena", "Places", "Words", "Transportation"].each do |category|
      Category.create(:name => category)
    end
    
    add_column :catalog_entries, :category_id, :integer
  end

  def self.down
    remove_column :catalog_entries, :category_id
    drop_table :categories
  end
end


# create_table :entries_categories, :force => true do |t|
#   t.integer :category_id
#   t.integer :catalog_entry_id
#   t.timestamps
# end

    # drop_table :entries_categories