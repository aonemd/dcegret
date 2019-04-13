class Account < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :username, :password
  validates_uniqueness_of :email, :username
  validates_format_of :email, with: /@/
  validates_format_of :username, without: /@/
  validates_length_of :password, minimum: 8
end
