class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :account

  validates_presence_of :body, :conversation_id
  validates_length_of :body, maximum: 5000

  default_scope { order(updated_at: :desc) }
end
