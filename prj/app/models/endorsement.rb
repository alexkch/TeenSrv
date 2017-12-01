class Endorsement < ApplicationRecord
  belongs_to :end_user, :class_name => "User"
  belongs_to :ref_user, :class_name => "User"

  validate :check_endorsement_users

  # This is for checking that a user cannot endorse themselves or endorse a client
  def check_endorsement_users
  	if (ref_user_id == end_user_id)
  		errors.add(:ref_user_id, "cannot endorse yourself")
  	end
  end
end
