class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :title
      t.text   :content
      t.integer :user_id
      t.integer :category_id
      t.integer :status
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
