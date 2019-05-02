class Post < ApplicationRecord
  attr_encrypted :content, key: Rails.application.credentials.encryptor[0..31]

  has_many :likes, dependent: :destroy, class_name: 'Post::Like'
  belongs_to :account

  validates_presence_of :content, message: 'content cannot be blank'
  validates :content, length: { maximum: 180,
                                too_long: "%{count} is the maximum allowed" }

  scope :ordered, -> { order(created_at: :desc) }
  scope :public_posts, -> { where(private: false) }
  scope :private_posts, -> { where(private: true) }

  def liked_by?(account)
    likes.where(account_id: account.id).exists?
  end
end
