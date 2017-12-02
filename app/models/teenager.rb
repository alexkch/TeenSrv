class Teenager < ApplicationRecord
    belongs_to :user, optional: true, :foreign_key => 'user_id'
    has_many :skill
    has_many :job
    has_many :apply_job
    has_many :cancel_job
    has_many :transactions
    has_many :winner, :class_name => 'ApplyJob', :foreign_key => 'winner_id'

	validates :address, presence: true
    validates :apt_no, presence: true
    validates :city, presence: true
    validates :province, presence: true
    validates :country, presence: true
    validates :postal_code, presence: true
    
    validate :found_teen_address

    geocoded_by :teen_address do |object, results|
    	if results.present?
     		object.latitude = results.first.latitude
     		object.longitude = results.first.longitude
    	else
     		object.latitude = nil
     		object.longitude = nil
    	end
    end

    before_validation :geocode, :if => lambda{ |obj| obj.teen_address_changed? }

    def teen_address
    	[address, city, province, country].compact.join(', ')
    end

    # Checks if the address changed, in order to update the address 

    def teen_address_changed?
    	attrs = %w(address city province country)
    	attrs.any?{|a| send "#{a}_changed?"}
    end

    # Checks if the api found a result for the address
     
    def found_teen_address
    	if latitude.blank? || longitude.blank?
      		errors.add(:address, "could not be found")
    	end
 	end
end
