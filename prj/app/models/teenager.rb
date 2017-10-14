class Teenager < ApplicationRecord
    belongs_to :user, optional: true
    # has_one :address
    # has_many: skills
end
