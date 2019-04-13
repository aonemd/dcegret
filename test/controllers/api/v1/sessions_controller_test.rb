require 'test_helper'

class Api::V1::SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @account = create(:account,
                   email: "#{Faker::Internet.user_name}@random.com",
                   username: Faker::Internet.user_name,
                   password: '12345678')
  end

  test "sign_in successfully by email" do
    post '/api/v1/sign_in', params: { identity: @account.email,
                                      password: '12345678' }

    assert_response :success
    assert_equal json_response.keys, ['token']
  end

  test "sign_in successfully by username" do
    post '/api/v1/sign_in', params: { identity: @account.username,
                                      password: '12345678' }

    assert_response :success
    assert_equal json_response.keys, ['token']
  end

  test "sign_in unsuccessfully by email" do
    post '/api/v1/sign_in', params: { identity: @account.email,
                                      password: 'wrong password' }

    assert_response :unauthorized
  end
end
