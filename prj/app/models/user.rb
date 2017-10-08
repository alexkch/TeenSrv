class User < ApplicationRecord
  
  has_one :profile
  has_one :payment
  has_many :address
  has_one :endorsement		
  validates :username, presence: true,
                    length: { minimum: 6 }
  validates :password, presence: true,
                    length: { minimum: 6 }
end