class Account < ApplicationRecord
  has_secure_password

  has_many :posts

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
end
