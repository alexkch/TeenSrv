class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.references :job_type
      t.references :teenager
      t.references :client
      t.text :description
      t.integer :amount
      t.integer :hours
      t.datetime :starttime
      t.datetime :finishtime

      t.timestamps
    end
  end
end
