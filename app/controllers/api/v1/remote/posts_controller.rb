class Api::V1::Remote::PostsController < ApplicationController
  include RemoteHelper

  def index
    local_posts = PostDecorator.decorate_collection(Post.all)

    # get federated posts
    federated_posts = []
    get_servers.each do |server|
      next if request.host_with_port == server['address']

      api_url = to_url(server['address']) + '/api/v1/posts.json'
      begin
        _posts = json_response(HTTParty.get(api_url))['posts']
      rescue
        next
      end
      federated_posts.append(_posts)
    end

    posts = local_posts + federated_posts.flatten

    render json: { posts: posts }
  end
end
