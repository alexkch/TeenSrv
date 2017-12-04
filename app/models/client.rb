class Client < ApplicationRecord
    belongs_to :user
    has_many :jobs
    has_many :apply_jobs
    has_many :cancel_jobs
    has_many :transactions

    #validates :fName, presence: true
    #validates :lName, presence: true 
    #validates :gender, presence: true 
    #validates :birth_year, presence: true
    #validates :birth_month, presence: true
    #validates :birth_day, presence: true
    validates :address, presence: true
    validates :apt_no, presence: true
    validates :city, presence: true
    validates :province, presence: true
    validates :country, presence: true
    validates :postal_code, presence: true
    
    validate :found_client_address

    geocoded_by :client_address do |object, results|
    	if results.present?
     		object.latitude = results.first.latitude
     		object.longitude = results.first.longitude
    	else
     		object.latitude = nil
     		object.longitude = nil
    	end
    end

    before_validation :geocode, :if => lambda{ |obj| obj.client_address_changed? }

    def client_address
    	[address, city, province, country].compact.join(', ')
    end

    # Checks if the address changed, in order to update the address 

    def client_address_changed?
    	attrs = %w(address city province country)
    	attrs.any?{|a| send "#{a}_changed?"}
    end

    # Checks if the api found a result for the address
     
    def found_client_address
    	if latitude.blank? || longitude.blank?
      		errors.add(:address, "could not be found")
    	end
 	end
end
