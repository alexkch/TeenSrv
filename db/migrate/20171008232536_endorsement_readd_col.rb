class EndorsementReaddCol < ActiveRecord::Migration[5.1]
  def change
  	remove_column :endorsements, :endorsed_user_id, :reference
  	remove_column :endorsements, :reference_user_id, :reference
  	add_reference :endorsements, :ref_user
  	add_reference :endorsements, :end_user
  end
end
