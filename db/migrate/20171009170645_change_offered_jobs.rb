class ChangeOfferedJobs < ActiveRecord::Migration[5.1]
  def change
  	change_table :offered_jobs do |t|
  		t.rename :jobtype_id, :job_type_id
	end
  end
end
