class Transaction < ApplicationRecord
  belongs_to :client
  belongs_to :teenager
  belongs_to :job
  belongs_to :payment
end
