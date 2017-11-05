class Teenager < ApplicationRecord
    belongs_to :user, optional: true, :foreign_key => 'user_id'
    has_many :skill
    has_many :jobs
    has_many :apply_jobs
    has_many :cancel_jobs
end
