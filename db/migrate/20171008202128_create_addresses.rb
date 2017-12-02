class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :street_no
      t.text :street
      t.integer :apt_no
      t.string :postalcode
      t.string :city
      t.string :province
      t.integer :address_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
