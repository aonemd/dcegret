class Account < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :likes, dependent: :destroy, class_name: 'Post::Like'
  has_many :passive_relationships, class_name:  'Account::Relationship',
                                   foreign_key: 'followed_id',
                                   dependent:   :destroy
  has_many :active_relationships,  class_name:  'Account::Relationship',
                                   foreign_key: 'follower_id',
                                   dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships,  source: :followed

  validates_presence_of :email, :username, :password
  validates_uniqueness_of :email, :username
  validates_format_of :email, with: /@/
  validates_format_of :username, without: /@/
  validates_length_of :password, minimum: 8

  def self.find_by_identity(identity)
    return nil unless identity

    if identity.include?('@') && identity.include?('.')
      Account.find_by(email: identity)
    else
      Account.find_by(username: identity)
    end
  end

  def follow(other_account)
    return if self == other_account

    following << other_account
  end

  def unfollow(other_account)
    return if self == other_account

    following.delete(other_account)
  end

  def following?(other_account)
    following.include?(other_account)
  end

  def followed_by?(other_account)
    followers.include?(other_account)
  end
end
