class Skill < ApplicationRecord
	belongs_to :teenager, :foreign_key => "teenager_id"
	has_one :skill_type
end
