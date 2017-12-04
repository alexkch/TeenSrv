class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :job, foreign_key: true
      t.references :ref_user, foreign_key: true
      t.references :end_user, foreign_key: true
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
