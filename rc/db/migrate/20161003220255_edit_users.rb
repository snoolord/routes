class EditUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false, default: 'admin'
    add_index :users, :username
    remove_column :users, :email, :string
    remove_column :users, :name, :string
  end
end
