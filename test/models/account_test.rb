require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "validate presence of accountname and email" do
    account = build(:account, email: nil, username: nil)

    assert_equal account.valid?, false
  end

  test "validate format of email contains an @" do
    account = build(:account, email: 'hellworld')

    refute account.valid?
  end

  test "validate format of username" do
    account = build(:account, username: 'hell@yeah')

    refute account.valid?
  end

  test "validate minimum length of password is 8 chars" do
    account = build(:account, password: '123')

    refute account.valid?
  end

  test "#find_by_identity using email" do
    created_account = create(:account)

    account = Account.find_by_identity(created_account.email)

    assert_instance_of Account, account
  end

  test "should followe another account" do
    followed_account = create(:account_with_settings)
    follower_account = create(:account_with_settings)

    follower_account.follow(followed_account)

    assert follower_account.following?(followed_account)
    assert followed_account.followed_by?(follower_account)
  end

  test "should unfollow an existing account" do
    followed_account = create(:account_with_settings)
    follower_account = create(:account_with_settings)

    follower_account.follow(followed_account)
    follower_account.unfollow(followed_account)

    refute follower_account.following?(followed_account)
  end
end
