class Payment < ApplicationRecord
  belongs_to :user
  has_one :credit_cards
  has_one :bank_infos
end
