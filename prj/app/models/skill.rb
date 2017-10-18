class Skill < ApplicationRecord
	belongs_to :user, optional: true
end
