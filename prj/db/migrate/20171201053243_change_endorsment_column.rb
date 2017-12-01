class ChangeEndorsmentColumn < ActiveRecord::Migration[5.1]
  def change
  	remove_column :endorsements, :comment, :string
  	add_column :endorsements, :skill, :string
  end
end
