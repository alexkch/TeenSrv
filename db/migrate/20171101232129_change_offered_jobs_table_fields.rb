class ChangeOfferedJobsTableFields < ActiveRecord::Migration[5.1]
  def change
  	remove_column :offered_jobs, :description, :string
  	remove_column :offered_jobs, :duration_start, :datetime
  	remove_column :offered_jobs, :duration_finish, :datetime
  	add_column :offered_jobs, :client_id, :integer
  	add_column :offered_jobs, :teenager_id, :integer
  end
end
