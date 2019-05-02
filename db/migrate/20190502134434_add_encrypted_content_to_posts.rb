class AddEncryptedContentToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :encrypted_content, :text, null: false
    add_column :posts, :encrypted_content_iv, :string

    remove_column :posts, :content, :text

    add_index :posts, :encrypted_content_iv, unique: true
  end
end
