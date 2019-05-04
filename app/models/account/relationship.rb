class Account::Relationship < ApplicationRecord
  belongs_to :followed, class_name: 'Account'
  belongs_to :follower, class_name: 'Account'

  validates_presence_of :followed, :follower

  scope :accepted, -> { where(accepted: true) }
  scope :requested, -> { where(accepted: false) }

  # TODO: refactor this
  before_create :set_accepted

  private

  def set_accepted
    self.accepted = false if followed.settings.private_profile?
  end
end
