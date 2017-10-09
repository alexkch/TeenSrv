class AcceptedJob < ApplicationRecord
  belongs_to :job
  belongs_to :teenager
  belongs_to :trans
end
