class AddColumnToFinishedJobs < ActiveRecord::Migration[5.1]
  def change
  	add_column :finished_jobs, :paid, :boolean, default: false
  end
end
