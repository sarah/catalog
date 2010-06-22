class AddStatusToEntries < ActiveRecord::Migration
  def self.up
    add_column :catalog_entries, :status, :string
  end

  def self.down
    remove_column :catalog_entries, :status
  end
end
