require 'test_helper'

class Api::V2::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "sign up successfully" do
    post '/api/v2/sign_up', params: attributes_for(:account)

    assert_response :ok
    assert_equal json_response.keys, ['token']
    assert JWTEncoderDecoder.decode(json_response['token'])['id']
  end

  test "sign up unsuccessfully" do
    post '/api/v2/sign_up', params: {
      email: nil,
      username: Faker::Internet.user_name,
      password: '12345678'
    }

    assert_response :bad_request
  end
end
