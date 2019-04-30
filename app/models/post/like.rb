class Post::Like < ApplicationRecord
  belongs_to :post
  belongs_to :account

  validates_presence_of :post_id, :account_id
  validates_uniqueness_of :post_id, scope: :account_id
end
