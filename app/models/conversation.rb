class Conversation < ApplicationRecord
  has_many :messages, -> { ordered }, dependent: :destroy

  belongs_to :sender, foreign_key: :sender_id, class_name: 'Account'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'Account'

  validates_uniqueness_of :sender, scope: :recipient

  scope :ordered, -> { order(updated_at: :desc) }
  scope :mine, lambda { |my_id|
    where('conversations.sender_id = ? OR conversations.recipient_id = ?', my_id, my_id)
  }
  scope :between, lambda { |sender_id, recipient_id|
    where('(conversations.sender_id = ? AND conversations.recipient_id = ?) OR
          (conversations.sender_id = ? AND conversations.recipient_id = ?)',
          sender_id, recipient_id, recipient_id, sender_id)
  }

  def with(me)
    me == sender ? recipient : sender
  end
end
