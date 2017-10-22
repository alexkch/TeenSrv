class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.references :skill_type
      t.references :teenager, foreign_key: true

      t.integer :experience_time
      t.string :experience_quantifier
      t.string :description

      t.timestamps
    end
  end
end
