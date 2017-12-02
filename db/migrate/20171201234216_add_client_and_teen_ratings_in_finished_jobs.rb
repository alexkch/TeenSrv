class AddClientAndTeenRatingsInFinishedJobs < ActiveRecord::Migration[5.1]
  def change
  	add_column :finished_jobs, :clients_rating, :float, default: 3
  	add_column :finished_jobs, :teens_rating, :float, default: 3
  end
end
