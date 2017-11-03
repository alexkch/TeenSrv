class CreateApplyJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :apply_jobs do |t|
      t.integer :job_id
      t.integer :client_id
      t.integer :teenager_id
      t.boolean :filled
      t.integer :winner_id

      t.timestamps
    end
  end
end
