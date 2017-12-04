class AddColumnsToTeenagers < ActiveRecord::Migration[5.1]
  def change
    add_column :teenagers, :address, :string
    add_column :teenagers, :apt_no, :integer
    add_column :teenagers, :city, :string
    add_column :teenagers, :province, :string
    add_column :teenagers, :country, :string
    add_column :teenagers, :postal_code, :string
  end
end
