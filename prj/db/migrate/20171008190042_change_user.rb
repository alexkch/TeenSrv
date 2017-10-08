class ChangeUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :usertype, :integer
  	remove_column :users, :first_name, :string
  	remove_column :users, :last_name, :string
  end
end
