class AddLongAndLatToTeenagers < ActiveRecord::Migration[5.1]
  def change
    add_column :teenagers, :latitude, :float
    add_column :teenagers, :longitude, :float
  end
end
