class AddAccountIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :account, foreign_key: true
  end
end
