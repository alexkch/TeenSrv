class AddGenderToTeenagers < ActiveRecord::Migration[5.1]
  def change
    add_column :teenagers, :gender, :string
  end
end
