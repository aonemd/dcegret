class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :account

  validates_presence_of :body, :conversation_id
  validates_length_of :body, maximum: 5000

  scope :ordered, -> { order(updated_at: :asc) }
end
