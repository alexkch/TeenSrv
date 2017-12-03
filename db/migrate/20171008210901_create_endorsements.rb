class CreateEndorsements < ActiveRecord::Migration[5.1]
    def up
    create_table :endorsements do |t|
      t.references :end_user_id, foreign_key: true
      t.references :ref_user_id, foreign_key: true
      t.string :skill
      t.integer :removed
      t.timestamps
    end
  end
end
