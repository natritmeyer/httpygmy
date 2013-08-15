require 'net/http'

class HttPygmy
  attr_accessor :base_url
  attr_accessor :username
  attr_accessor :password
  
  def initialize(base_url, username = nil, password = nil)
    @base_url = base_url
    @username = username
    @password = password
  end
  
  def get(path = "", headers = {})
    uri = URI.parse("#{@base_url}#{path}")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    request.basic_auth @username, @password unless @username.nil?
    headers.keys.each {|key| request[key] = headers[key]}
    http.request(request)
  end
end

