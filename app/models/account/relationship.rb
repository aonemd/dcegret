class Account::Relationship < ApplicationRecord
  belongs_to :followed, class_name: 'Account'
  belongs_to :follower, class_name: 'Account'

  validates :followed_id, presence: true
  validates :follower_id, presence: true
end
