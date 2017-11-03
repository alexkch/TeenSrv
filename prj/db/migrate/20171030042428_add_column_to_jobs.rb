class AddColumnToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :description, :string
    add_column :jobs, :cancelled, :boolean, default: false
  end
end
