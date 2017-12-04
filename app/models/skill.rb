class Skill < ApplicationRecord
	belongs_to :teenager, :foreign_key => "teenager_id"
	belongs_to :skill_type, optional: true
end
