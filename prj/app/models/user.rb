class User < ApplicationRecord
  
  has_one :profile	
  validates :username, presence: true,
                    length: { minimum: 6 }
  validates :password, presence: true,
                    length: { minimum: 6 }
end