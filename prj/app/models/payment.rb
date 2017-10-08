class Payment < ApplicationRecord
  belongs_to :user
  has_many :credit_cards
  has_many :bank_infos
end
