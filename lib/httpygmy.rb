require 'net/http'

class HttPygmy
  attr_accessor :base_url
  attr_accessor :headers
  attr_accessor :username
  attr_accessor :password
  
  def initialize(base_url, headers = {}, username = nil, password = nil)
    @base_url = base_url
    @headers  = headers
    @username = username
    @password = password
  end
  
  def get(path = "", headers = {})
    http, request = configure_request path, headers, Net::HTTP::Get
    http.request(request)
  end
  
  def post(path, headers = {}, body = "")
    http, request = configure_request path, headers, Net::HTTP::Post
    request.body = body
    http.request(request)
  end
  
  def put(path, headers = {}, body = "")
    http, request = configure_request path, headers, Net::HTTP::Put
    request.body = body
    http.request(request)
  end
  
  def delete(path, headers = {})
    http, request = configure_request path, headers, Net::HTTP::Delete
    http.request(request)
  end
  
  private
  
  def configure_request(path, headers, http_method)
    uri = URI.parse("#{@base_url}#{path}")
    http = Net::HTTP.new(uri.host, uri.port)
    request = http_method.new(uri.request_uri)
    request.basic_auth @username, @password unless @username.nil?
    all_headers = @headers.merge(headers)
    all_headers.keys.each {|key| request[key] = all_headers[key]}
    return http, request
  end
end

