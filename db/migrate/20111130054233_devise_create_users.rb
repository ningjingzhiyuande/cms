class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
     t.database_authenticatable :null => false  
     # t.string :encrypted_password, :null => false, :default => '', :limit => 128
      t.recoverable
      t.rememberable
      t.trackable         
      t.string :login,:null=>false  
      t.boolean :admin   ,:default=>false 

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable
   t.timestamps
    end

    add_index :users, :login,                :unique => true
    add_index :users, :reset_password_token, :unique => true     
    User.create({"login"=>"admin","email"=>"email@test.com","password"=>"myadmin","admin"=>true})
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
