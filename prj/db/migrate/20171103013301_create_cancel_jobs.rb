class CreateCancelJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :cancel_jobs do |t|
      t.integer :job_id
      t.integer :user_id
      t.datetime :cancelled_at
      t.timestamps
    end
  end
end
