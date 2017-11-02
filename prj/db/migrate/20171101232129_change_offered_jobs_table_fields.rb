class ChangeOfferedJobsTableFields < ActiveRecord::Migration[5.1]
  def change
  	remove_column :offered_jobs, :description
  	remove_column :offered_jobs, :duration_start
  	remove_column :offered_jobs, :duration_finish
  	add_column :offered_jobs, :client_id, :integer
  	add_column :offered_jobs, :teenager_id, :integer
  end
end
