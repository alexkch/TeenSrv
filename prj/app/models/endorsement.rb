class Endorsement < ApplicationRecord
  belongs_to :endorsed_user, :class_name => "User"
  belongs_to :reference_user, :class_name => "User"
end
