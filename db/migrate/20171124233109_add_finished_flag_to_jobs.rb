class AddFinishedFlagToJobs < ActiveRecord::Migration[5.1]
  def change
  	add_column :jobs, :finished, :boolean, default: false
  end
end
