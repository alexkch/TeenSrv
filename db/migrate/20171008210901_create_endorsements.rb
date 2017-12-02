class CreateEndorsements < ActiveRecord::Migration[5.1]
  create_table :endorsements do |t|
    def up
      t.references :endorsed_user, index: true, foreign_key: true
      t.references :reference_user, index: true, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
