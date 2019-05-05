require 'test_helper'
require 'jwt_encoder_decoder'

class Api::V2::SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @account = create(:account)
  end

  test "sign_in successfully by email" do
    post '/api/v2/sign_in', params: { identity: @account.email,
                                      password: '12345678' }

    assert_response :ok
    assert_equal json_response.keys, ['token']
    assert_equal JWTEncoderDecoder.decode(json_response['token'])['id'], @account.id
  end

  test "sign_in successfully by username" do
    post '/api/v2/sign_in', params: { identity: @account.username,
                                      password: '12345678' }

    assert_response :ok
    assert_equal json_response.keys, ['token']
  end

  test "sign_in unsuccessfully by email" do
    post '/api/v2/sign_in', params: { identity: @account.email,
                                      password: 'wrong password' }

    assert_response :unauthorized
  end
end
