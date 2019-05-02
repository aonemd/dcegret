class AddEncryptedBodyToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :encrypted_body, :text, null: false
    add_column :messages, :encrypted_body_iv, :string
    remove_column :messages, :body, :text

    add_index :messages, :encrypted_body_iv, unique: true
  end
end
