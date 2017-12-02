class CreateCancelledJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :cancelled_jobs do |t|
      t.references :job, foreign_key: true
      t.references :teenager
      t.datetime :cancel_time

      t.timestamps
    end
  end
end
