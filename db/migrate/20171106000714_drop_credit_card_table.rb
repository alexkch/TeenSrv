class DropCreditCardTable < ActiveRecord::Migration[5.1]
  def change
      drop_table :credit_cards
  end
end
