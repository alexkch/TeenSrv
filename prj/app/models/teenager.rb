class Teenager < ApplicationRecord
    belongs_to :user, optional: true, :foreign_key => 'user_id'
    has_many :skill
    has_many :job
    has_many :apply_job
    has_many :cancel_job
    has_many :transactions
	  has_many :winner, :class_name => 'ApplyJob', :foreign_key => 'winner_id'
end
