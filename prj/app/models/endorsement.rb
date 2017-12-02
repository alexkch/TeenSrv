class Endorsement < ApplicationRecord
  belongs_to :endorsed_user, :class_name => "User", foreign_key: "endoresed_user_id"
  belongs_to :reference_user, :class_name => "User", foreign_key: "reference_user_id"

  validate :check_endorsement_users

  # This is for checking that a user cannot endorse themselves or endorse a client
  def check_endorsement_users
  	if (ref_user_id == end_user_id)
  		errors.add(:ref_user_id, "cannot endorse yourself")
  	end
  end
end
