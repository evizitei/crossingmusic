class AddNameToContactMessages < ActiveRecord::Migration
  def self.up
    add_column :contact_messages, :name, :string
  end

  def self.down
    remove_column :contact_messages, :name
  end
end
