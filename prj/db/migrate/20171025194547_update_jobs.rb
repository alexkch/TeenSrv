class UpdateJobs < ActiveRecord::Migration[5.1]
  def change
  	remove_column :jobs, :description
  	remove_column :jobs, :teenager
  end
end
