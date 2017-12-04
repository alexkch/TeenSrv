class Job < ApplicationRecord
	has_one :job_type
	has_many :apply_job
	has_many :offered_job
	belongs_to :teenager, optional: true
	belongs_to :client
	belongs_to :trans, optional: true

	validates :description, presence: true, length: {minimum: 10, maximum: 100}
	validates :hourly_rate, :presence => true, :numericality => { :greater_than_or_equal_to => 12}, 
	:format => { :with => /\A\d{1,4}(\.\d{0,2})?\z/ }
	validates :hours, presence: true, numericality: { only_integer: true }
	validates_datetime :starttime
	validates_datetime :finishtime
	validates_datetime :finishtime, :after => :starttime
	# We need to know user's time zone to do this properly
	#validates_datetime :starttime, :on_or_after => DateTime.now
	validate :validate_hours

	def validate_hours 
		if (hours != (finishtime.to_time - starttime.to_time)/1.hours)
			errors.add(:hours, "has to be equal to the difference between start time and finish time")
		end
	end 
end
