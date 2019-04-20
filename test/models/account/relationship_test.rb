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
end
