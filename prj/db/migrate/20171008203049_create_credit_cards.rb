class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.references :payment, foreign_key: true
      t.string :card_type
      t.string :card_name
      t.integer :card_number
      t.integer :cvc
      t.integer :card_expiry

      t.timestamps
    end
  end
end
