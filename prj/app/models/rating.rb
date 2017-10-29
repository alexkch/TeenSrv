class Rating < ApplicationRecord
  belongs_to :job, :class_name => "FinishedJob"
  belongs_to :ref_user, :class_name => "User"
  belongs_to :end_user, :class_name => "User"

  validates :rating, numericality: {only_integer: true}, inclusion: {in: 1..5, message: "has to be between 1 and 5"}
  validates :review, presence: true, length: {minimum: 10, maximum: 50}
  
end
