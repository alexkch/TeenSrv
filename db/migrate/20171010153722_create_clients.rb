class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :job_wanted
      t.references :user, foreign_key: true
      t.string :fName
      t.string :lName
      t.string :gender
	  t.integer :birth_year
	  t.integer :birth_month
	  t.integer :birth_day
	  t.string :address
	  t.integer :apt_no
	  t.string :city
	  t.string :province
	  t.string :country
	  t.string :postal_code
      t.timestamps
    end
  end
end
