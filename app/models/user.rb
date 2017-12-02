class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :teenager, dependent: :destroy
  has_one :client, dependent: :destroy
  has_many :payment
  has_many :r_endorsement, :class_name => 'Endorsement', :foreign_key => 'ref_user_id'
  has_many :g_endorsement, :class_name => 'Endorsement', :foreign_key => 'end_user_id'	

  # General 'has a Stripe account' check
  def connected?; !stripe_user_id.nil?; end

  # Stripe account type checks
  def managed?; stripe_account_type == 'managed'; end
  def standalone?; stripe_account_type == 'standalone'; end
  def oauth?; stripe_account_type == 'oauth'; end

  def manager
    case stripe_account_type
    when 'managed' then StripeManaged.new(self)
    when 'standalone' then StripeStandalone.new(self)
    when 'oauth' then StripeOauth.new(self)
    end
  end

  def can_accept_charges?
    return true if oauth?
    return true if managed? && stripe_account_status['charges_enabled']
    return true if standalone? && stripe_account_status['charges_enabled']
    return false
  end
end