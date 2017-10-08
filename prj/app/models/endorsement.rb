class Endorsement < ApplicationRecord
  belongs_to :end_user, :class_name => "User"
  belongs_to :ref_user, :class_name => "User"
end
