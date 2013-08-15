require 'bundler'
Bundler.setup :development

require 'httpygmy'
require 'webmock/rspec'
include WebMock::API

RSpec.configure do |config|
  config.mock_framework = :rspec
end

