require 'test_helper'

class Api::V1::Accounts::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @follower_account = create(:account)
    @followed_account = create(:account)
    @token            = authenticated_account_token(@follower_account)
  end

  test "#create unauthorized" do
    assert_no_difference 'Account::Relationship.count' do
      post "/api/v1/accounts/relationships",
        params: { followed_id: @followed_account.id }
    end

    assert_response :unauthorized
  end

  test "#create" do
    assert_difference 'Account::Relationship.count' do
      post "/api/v1/accounts/relationships",
        params: { followed_id: @followed_account.id },
        headers: { 'Authorization': "Bearer #{@token}" }
    end

    assert_response :no_content
  end

  test "#destroy" do
    @follower_account.follow(@followed_account)
    relationship = @follower_account.active_relationships.first

    assert_difference 'Account::Relationship.count', -1 do
      delete "/api/v1/accounts/relationships/#{relationship.id}",
        headers: { 'Authorization': "Bearer #{@token}" }
    end

    assert_response :no_content
  end
end
