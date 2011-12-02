class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string  :name,:null=>false
      t.integer :user_id
      t.string  :ancestry 
      t.integer :position
      t.string  :kind
      t.timestamps
    end     
    #add_index :categories ,:parent_id     
    add_index :categories ,:ancestry
    add_index :categories ,:user_id
  end

  def self.down
    drop_table :categories
  end
end
