class CreateSkillTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
