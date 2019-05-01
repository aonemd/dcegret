class Account::Relationship < ApplicationRecord
  belongs_to :followed, class_name: 'Account'
  belongs_to :follower, class_name: 'Account'

  validates :followed_id, presence: true
  validates :follower_id, presence: true

  scope :accepted, -> { where(accepted: true) }
  scope :requested, -> { where(accepted: false) }

  before_create :set_accepted

  private

  def set_accepted
    self.accepted = false if followed.settings.private_profile?
  end
end
