class AddEndorsmentFk < ActiveRecord::Migration[5.1]
  def change
  	add_foreign_key :endorsements, :ref_user_id
  	add_foreign_key :endorsements, :end_user_id
  end
end
