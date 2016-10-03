class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, null: false, default: 'ewadas'
    add_column :users, :email, :string, null: false, default: 'dwaewoqj'
  end
end
