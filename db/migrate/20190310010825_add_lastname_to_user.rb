class AddLastnameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lastname, :string
    add_column :users, :nickname, :string    
  end
end
