class CreateEndorsements < ActiveRecord::Migration[5.1]
    def up
    create_table :endorsements do |t|
      t.references :end_user
      t.references :ref_user
      t.string :skill
      t.integer :removed
      t.timestamps
    end
  end
end
