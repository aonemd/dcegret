require 'test_helper'

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @token = authenticated_account_token
  end

  test "#index" do
    get '/api/v1/posts'

    assert_response :success
    assert_equal json_response.keys, ['posts']
    assert_equal json_response['posts'].count, Post.count
  end

  test "#create successfull" do
    post '/api/v1/posts', params: {
      post: { content: Faker::TvShows::Friends.quote }
    }, headers: { 'Authorization': "Bearer #{@token}" }

    assert_response :success
    assert_equal json_response.keys, ['post']
  end

  test "#create unsuccessfully" do
    post '/api/v1/posts', params: {
      post: { content: 'a'*181 }
    }, headers: { 'Authorization': "Bearer #{@token}" }

    assert_response :bad_request
    assert json_response.keys, ['errors']
  end
end
