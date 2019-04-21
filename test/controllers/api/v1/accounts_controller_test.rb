require 'test_helper'

class Api::V1::AccountsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @account1 = create(:account)
    @account2 = create(:account)

    @account1.follow(@account2)
  end

  test "#index" do
    get '/api/v1/accounts'

    assert_response :success
    assert_equal json_response.keys, ['accounts']
    assert_equal json_response['accounts'].count, Account.count
  end

  test "#show" do
    get "/api/v1/accounts/#{@account1.id}"

    assert_response :success
    assert_equal json_response.keys, ['account']
    assert_equal json_response['account'], AccountDecorator.new(@account1).decorate
  end

  test "following" do
    get "/api/v1/accounts/#{@account1.id}/following"

    assert_response :success
    assert_equal json_response.keys, ['accounts']
    assert_equal json_response['accounts'], AccountDecorator.decorate_collection([@account2])
  end

  test "followers" do
    get "/api/v1/accounts/#{@account2.id}/followers"

    assert_response :success
    assert_equal json_response.keys, ['accounts']
    assert_equal json_response['accounts'], AccountDecorator.decorate_collection([@account1])
  end
end
