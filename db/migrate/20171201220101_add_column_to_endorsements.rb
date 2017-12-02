class AddColumnToEndorsements < ActiveRecord::Migration[5.1]
  def change
  	add_column :endorsements, :removed, :integer
  end
end
