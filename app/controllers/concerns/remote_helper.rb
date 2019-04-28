module RemoteHelper
  extend ActiveSupport::Concern

  def get_servers
    resp = HTTParty.get('http://localhost:3001/servers.json')
    json_response(resp)
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
