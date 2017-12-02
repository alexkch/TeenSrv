class DeclinedJob < ApplicationRecord
  belongs_to :job
  belongs_to :teenager
end
