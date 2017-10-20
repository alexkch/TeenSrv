class Teenager < ApplicationRecord
    belongs_to :user, :foreign_key => 'user_id'
    has_many :skill
end
