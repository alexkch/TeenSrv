class CreateCancelJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :cancel_jobs do |t|
      t.belongs_to :job, index: true
      t.belongs_to :user, index: true
      t.datetime :cancelled_at
      t.timestamps
    end
  end
end
