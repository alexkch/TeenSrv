class CreateAcceptedJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :accepted_jobs do |t|
      t.references :job, foreign_key: true
      t.references :teenager
      t.references :trans
      t.datetime :accept_time

      t.timestamps
    end
  end
end
