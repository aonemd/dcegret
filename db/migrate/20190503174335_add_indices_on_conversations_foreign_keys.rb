class AddIndicesOnConversationsForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :conversations, :accounts, column: :sender_id
    add_foreign_key :conversations, :accounts, column: :recipient_id

    add_index :conversations, :sender_id, unique: true
    add_index :conversations, :recipient_id, unique: true
    add_index :conversations, [:sender_id, :recipient_id], unique: true
  end
end
