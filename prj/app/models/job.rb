class Job < ApplicationRecord
	has_one :job_type
	has_many :apply_job
	has_many :offered_job
	belongs_to :teenager, optional: true
	belongs_to :client
	belongs_to :trans, optional: true
end
