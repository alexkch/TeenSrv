class CreateBankInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_infos do |t|
      t.references :payment, foreign_key: true
      t.string :bank_name
      t.string :account_type
      t.string :account_name
      t.integer :account_number
      t.integer :transit_number

      t.timestamps
    end
  end
end
