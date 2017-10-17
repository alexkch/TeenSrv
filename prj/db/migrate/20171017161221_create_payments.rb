class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :paymenttype
      t.references :user, foreign_key: true
    end
  end
end
