class CreateFinishedJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :finished_jobs do |t|
      t.references :job, foreign_key: true
      t.references :teenager
      t.references :client
      t.references :trans
      t.datetime :finish_time

      t.timestamps
    end
  end
end
