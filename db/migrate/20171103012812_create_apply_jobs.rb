class CreateApplyJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :apply_jobs do |t|
      t.belongs_to :job, index: true
      t.belongs_to :client, index: true
      t.belongs_to :teenager, index: true
      t.boolean :filled
      t.integer :winner_id
      t.datetime :applied_at
      t.timestamps
    end
  end
end
