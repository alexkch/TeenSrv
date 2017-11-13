class SearchController < ApplicationController

	def search
		job_search
	end

	private 

	def job_search
		@job_types = JobType.where("name LIKE ?", "%#{params[:q]}%")
		@jobs = Job.where("job_type_id IN (?) AND accepted = ? AND cancelled = ?", @job_types.ids, false, false)
	end

	def teen_search

	end
end
