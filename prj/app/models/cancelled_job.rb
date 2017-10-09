class CancelledJob < ApplicationRecord
  belongs_to :job
  belongs_to :teenager
end
