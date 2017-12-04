class CreateBankInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_infos do |t|
      t.references :payment, foreign_key: true
      t.string :account_name
      t.integer :account_number
      t.integer :transit_number
      t.integer :institution_id
      t.timestamps
    end
  end
end
