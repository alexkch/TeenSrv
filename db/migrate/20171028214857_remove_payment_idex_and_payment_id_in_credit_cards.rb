class RemovePaymentIdexAndPaymentIdInCreditCards < ActiveRecord::Migration[5.1]
  def change
      remove_index "payment_id", name: "index_credit_cards_on_payment_id"
      remove_column :credit_cards, :payment_id, :integer
  end
end
