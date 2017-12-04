class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :client, foreign_key: true
      t.references :teenager, foreign_key: true
      t.references :job, foreign_key: true
      t.references :payment, foreign_key: true
      t.integer :amount
      t.datetime :trans_date
      t.string :status

      t.timestamps
    end
  end
end
