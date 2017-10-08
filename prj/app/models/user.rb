class User < ApplicationRecord
  
  has_one :profile
  has_one :payment
  has_many :address
  has_one :r_endorsement, :class_name => 'Endorsement', :foreign_key => 'ref_user_id'
  has_one :g_endorsement, :class_name => 'Endorsement', :foreign_key => 'end_user_id'	
  validates :username, presence: true,
                    length: { minimum: 6 }
  validates :password, presence: true,
                    length: { minimum: 6 }
end