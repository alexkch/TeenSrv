class RemoveEndorsmentFk < ActiveRecord::Migration[5.1]
  def change
  	remove_foreign_key :endorsements, :ref_user_id
  	remove_foreign_key :endorsements, :end_user_id
  end
end
