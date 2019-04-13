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
    created_account = create(:account,
                   email: "#{Faker::Internet.user_name}@random.com",
                   username: Faker::Internet.user_name,
                   password: '12345678')

    account = Account.find_by_identity(created_account.email)

    assert_instance_of Account, account
  end
end
