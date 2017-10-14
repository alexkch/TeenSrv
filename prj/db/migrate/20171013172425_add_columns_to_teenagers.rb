class AddColumnsToTeenagers < ActiveRecord::Migration[5.1]
  def change
    add_column :teenagers, :birth_day, :integer
  end
end
