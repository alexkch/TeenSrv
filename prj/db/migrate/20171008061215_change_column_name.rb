class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :title, :username
  	rename_column :users, :text, :password
  end
end
