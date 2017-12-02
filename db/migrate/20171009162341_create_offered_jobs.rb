class CreateOfferedJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :offered_jobs do |t|
      t.references :job, foreign_key: true
      t.references :jobtype
      t.text :description
      t.datetime :duration_start
      t.datetime :duration_finish

      t.timestamps
    end
  end
end
