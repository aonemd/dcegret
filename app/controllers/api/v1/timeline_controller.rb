class Api::V1::TimelineController < ApplicationController
  def index
    local_posts = PostDecorator.decorate_collection(Post.all)

    # get federated posts
    resp = HTTParty.get('http://localhost:3001/servers.json')
    federated_posts = []
    servers = json_response(resp)
    servers.each do |server|
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

  def json_response(response)
    result = JSON.parse(response.body)
    result.is_a?(Hash) ? result.with_indifferent_access : result
  rescue JSON::ParserError
    raise "JSON couldn't parse response with code: (#{response.code}) and \
    body: #{response.body}"
  end

  def to_url(url)
    /^http/i.match(url) ? url : "http://#{url}"
  end
end
