class CreateEndorsements < ActiveRecord::Migration[5.1]
  def change
    create_table :endorsements do |t|
      t.references :endorsed_user, foreign_key: true
      t.references :reference_user, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
