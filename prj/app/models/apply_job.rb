class ApplyJob < ApplicationRecord
	belongs_to :job
	belongs_to :client
	belongs_to :teenager
 	belongs_to :winner, :class_name => "Teenager"
end
