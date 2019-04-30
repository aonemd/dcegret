class CreatePostLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :post_likes do |t|
      t.references :post, foreign_key: true
      t.references :account, foreign_key: true

      t.timestamps
    end

    add_index :post_likes, [:post_id, :account_id], unique: true
  end
end
