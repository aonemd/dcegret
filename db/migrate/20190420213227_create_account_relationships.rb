class CreateAccountRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :account_relationships do |t|
      t.integer :follower_id, null: false
      t.integer :followed_id, null: false

      t.timestamps
    end

    add_index :account_relationships, :follower_id
    add_index :account_relationships, :followed_id
    add_index :account_relationships, [:follower_id, :followed_id], unique: true
  end
end
