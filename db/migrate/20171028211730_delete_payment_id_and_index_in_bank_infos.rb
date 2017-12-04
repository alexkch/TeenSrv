class DeletePaymentIdAndIndexInBankInfos < ActiveRecord::Migration[5.1]
  def change
      remove_index "bank_infos", name: "index_bank_infos_on_payment_id"
      remove_column :bank_infos, :payment_id, :integer
  end
end
