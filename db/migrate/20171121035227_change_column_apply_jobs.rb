class ChangeColumnApplyJobs < ActiveRecord::Migration[5.1]
  def change
  	remove_column :apply_jobs, :filled, :boolean
  	add_column :apply_jobs, :filled, :boolean, default: false
  end
end
