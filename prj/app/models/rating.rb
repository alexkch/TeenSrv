class Rating < ApplicationRecord
  belongs_to :job, :class_name => "FinishedJob"
  belongs_to :ref_user, :class_name => "User"
  belongs_to :end_user, :class_name => "User"
end
