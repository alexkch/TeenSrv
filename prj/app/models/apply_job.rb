class ApplyJob < ApplicationRecord
	belongs_to :job
	belongs_to :client
	belongs_to :teenager
end
