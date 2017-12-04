class ApplyJob < ApplicationRecord
	attr_accessor :teens_rating
	attr_accessor :clients_rating
	belongs_to :job
	belongs_to :client
	belongs_to :teenager
 	belongs_to :winner, :class_name => "Teenager", optional: true

 	validates :job_id, uniqueness: {scope: :teenager_id}
end
