class OfferedJob < ApplicationRecord
  belongs_to :job
  belongs_to :job_type
end