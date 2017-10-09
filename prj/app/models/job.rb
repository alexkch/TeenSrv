class Job < ApplicationRecord
  belongs_to :job_type
  belongs_to :teenager
  belongs_to :client
end
