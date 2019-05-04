require 'test_helper'

class Account::RelationshipTest < ActiveSupport::TestCase
  def setup
    @relationship = create(:account_relationship)
  end

  test "should be valid" do
    assert @relationship.valid?
  end

  test "should require a follower_id" do
    @relationship.follower_id = nil

    refute @relationship.valid?
  end

  test "should require a followed_id" do
    @relationship.followed_id = nil

    refute @relationship.valid?
  end

  test "should set accepted to false if account has a private_profile" do
    followed                          = create(:account_with_settings)
    followed.settings.private_profile = true
    relationship                      = create(:account_relationship, followed: followed)

    refute relationship.accepted
  end
end
