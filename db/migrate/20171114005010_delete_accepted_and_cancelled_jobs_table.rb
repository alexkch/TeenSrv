class DeleteAcceptedAndCancelledJobsTable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :cancelled_jobs
  	drop_table :accepted_jobs
  	drop_table :declined_jobs
  end
end
