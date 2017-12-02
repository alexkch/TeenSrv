class UpdateJobTypeAndJob < ActiveRecord::Migration[5.1]
  def change
  	remove_column :job_types, :description, :text
  	remove_column :jobs, :name, :string
  	remove_column :jobs, :amount, :integer
  	add_column :jobs, :hourly_rate, :float
  end
end
