class Teenager < ApplicationRecord
    belongs_to :user, optional: true, :foreign_key => 'user_id'
    has_many :skill
end
