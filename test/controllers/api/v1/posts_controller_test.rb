require 'test_helper'

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest
  test "#index" do
    get '/api/v1/posts'

    assert_response :success
    assert_equal json_response.keys, ['posts']
    assert_equal json_response['posts'].count, Post.count
  end

  test "#crate successfull" do
    post '/api/v1/posts', params: {
      post: { content: Faker::TvShows::Friends.quote }
    }

    assert_response :success
    assert_equal json_response.keys, ['post']
  end

  test "#create unsuccessfully" do
    post '/api/v1/posts', params: {
      post: { content: 'a'*181 }
    }

    assert_response :bad_request
    assert json_response.keys, ['errors']
  end
end
