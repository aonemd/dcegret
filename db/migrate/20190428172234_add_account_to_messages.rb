class AddAccountToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :account, foreign_key: true
  end
end
