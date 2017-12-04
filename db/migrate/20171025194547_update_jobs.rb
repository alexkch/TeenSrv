class UpdateJobs < ActiveRecord::Migration[5.1]
  def change
  	add_column :jobs, :name, :string
  	add_column :jobs, :accepted, :boolean, default: false
  end
end
