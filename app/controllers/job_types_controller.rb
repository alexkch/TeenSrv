class JobTypesController < ApplicationController
	def index
		@job_types = JobType.all		
	end
end
