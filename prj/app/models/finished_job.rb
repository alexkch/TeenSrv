class FinishedJob < ApplicationRecord
  belongs_to :job
  belongs_to :teenager
  belongs_to :client
  belongs_to :trans
end
