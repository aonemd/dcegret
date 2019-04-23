class Post < ApplicationRecord
  belongs_to :account

  validates_presence_of :content, message: 'content cannot be blank'
  validates :content, length: { maximum: 180,
                                too_long: "%{count} is the maximum allowed" }

  scope :ordered, -> { order(created_at: :desc) }
  scope :public_posts, -> { where(private: false) }
  scope :private_posts, -> { where(private: true) }
end
