class CreateDeclinedJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :declined_jobs do |t|
      t.references :job, foreign_key: true
      t.references :teenager
      t.datetime :decline_time

      t.timestamps
    end
  end
end
