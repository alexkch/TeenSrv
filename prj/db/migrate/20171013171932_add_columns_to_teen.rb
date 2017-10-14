class AddColumnsToTeen < ActiveRecord::Migration[5.1]
  def change
	add_column :teenagers, :birth_month, :integer
  end
end
