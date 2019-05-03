class Message < ApplicationRecord
  attr_encrypted :body, key: Rails.application.credentials.encryptor[0..31]

  belongs_to :conversation
  belongs_to :account

  validates_presence_of :body, :conversation
  validates_length_of :body, maximum: 5000

  scope :ordered, -> { order(updated_at: :asc) }
end
