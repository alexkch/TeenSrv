class Client < ApplicationRecord
    belongs_to :user
    has_many :jobs
    has_many :apply_jobs
    has_many :cancel_jobs
    has_many :transactions
end
