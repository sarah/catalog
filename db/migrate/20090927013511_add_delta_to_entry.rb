class AddDeltaToEntry < ActiveRecord::Migration
  def self.up
    add_column :catalog_entries, :delta, :boolean
    add_index :catalog_entries, :delta
  end

  def self.down
    remove_column :catalog_entries, :delta
  end
end
