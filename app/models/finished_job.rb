class FinishedJob < ApplicationRecord
  belongs_to :job
  belongs_to :teenager
  belongs_to :client
  belongs_to :trans, optional: true
  has_many :rating, :class_name => 'Rating', :foreign_key => 'job_id'
end
