class MoveTeenAndClientRatingsFromFinishedJobsToJobsTable < ActiveRecord::Migration[5.1]
  def change
  	remove_column :finished_jobs, :clients_rating, :float, default: 3
  	remove_column :finished_jobs, :teens_rating, :float, default: 3
  	add_column :jobs, :clients_rating, :float, default: 3
  	add_column :jobs, :teens_rating, :float, default: 3
  end
end
