class CreateTeenagers < ActiveRecord::Migration[5.1]
  def change
    create_table :teenagers do |t|
      t.string :skills
      t.references :user, foreign_key: true
      t.string :firstname
      t.string :lastname
      t.string :gender
	  t.integer :birth_year
	  t.integer :birth_month
	  t.integer :birth_day
      t.timestamps
    end
  end
end
