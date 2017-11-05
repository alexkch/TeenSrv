class Job < ApplicationRecord
	has_many :apply_job
	has_many :offered_job
	belongs_to :teenager
	belongs_to :client
	belongs_to :trans
end
