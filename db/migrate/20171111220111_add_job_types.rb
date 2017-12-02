class AddJobTypes < ActiveRecord::Migration[5.1]
  def change
  	# JobType.delete_all
  	# ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'job_types'") 
  	#### Previous line resets ID number --- delete this comment when re-migrating
  	  JobType.create(:name => 'babysitting')
	  JobType.create(:name => 'lawn mowing')
	  JobType.create(:name => 'leaf raking')
	  JobType.create(:name => 'weeding')
	  JobType.create(:name => 'yard cleanup')
	  JobType.create(:name => 'snow shoveling')
	  JobType.create(:name => 'furniture moving')
	  JobType.create(:name => 'simple cleaning tasks')
	  JobType.create(:name => 'vacation services')
	  JobType.create(:name => 'mail pickup')
	  JobType.create(:name => 'pet	feeding')
	  JobType.create(:name => 'lawn watering')
	  JobType.create(:name => 'dog	walking')
	  JobType.create(:name => 'computer help')
	  JobType.create(:name => 'tutoring')
	  JobType.create(:name => 'reading')
  end
end
