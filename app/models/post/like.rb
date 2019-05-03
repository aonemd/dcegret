class Post::Like < ApplicationRecord
  belongs_to :post
  belongs_to :account

  validates_presence_of :post, :account
  validates_uniqueness_of :post, scope: :account
end
