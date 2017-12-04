class AddColumnToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :paymenttype, :integer
  end
end
