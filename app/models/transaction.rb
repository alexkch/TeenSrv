class Transaction < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :teenager, optional: true
  belongs_to :job, optional: true
  belongs_to :payment, optional: true
end
