class CreateSkillTypes < ActiveRecord::Migration[5.1]
  def self.up
    create_table :skill_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    SkillType.create(:name => 'lawnmowing', :description => "Mowing the lawn.")
    SkillType.create(:name => 'snowshovelling', :description => "Shovelling the snow.")
    SkillType.create(:name => 'babysitting', :description => "Sitting the baby.")
    SkillType.create(:name => 'dogwalking', :description => "Walking the dog.")
  end

  def self.down
    drop_table :skill_types
  end
end
