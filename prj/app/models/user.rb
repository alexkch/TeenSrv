class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :teenager, dependent: :destroy
  has_one :client, dependent: :destroy
  has_many :payment
  has_many :address
  has_many :r_endorsement, :class_name => 'Endorsement', :foreign_key => 'ref_user_id'
  has_many :g_endorsement, :class_name => 'Endorsement', :foreign_key => 'end_user_id'	
  has_many :r_rating, :class_name => 'Rating', :foreign_key => 'ref_user_id'
  has_many :g_rating, :class_name => 'Rating', :foreign_key => 'end_user_id'

end