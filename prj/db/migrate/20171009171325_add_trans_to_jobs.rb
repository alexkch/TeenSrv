class AddTransToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :trans, foreign_key: true
  end
end
