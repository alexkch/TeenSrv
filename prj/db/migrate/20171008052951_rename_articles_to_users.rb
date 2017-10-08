class RenameArticlesToUsers < ActiveRecord::Migration[5.1]
  def change
	rename_table :articles, :users
  end
end
