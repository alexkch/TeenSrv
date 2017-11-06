class DropBankInfoTable < ActiveRecord::Migration[5.1]
  def change
      drop_table :bank_infos
  end
end
