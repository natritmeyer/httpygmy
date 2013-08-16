require 'bundler'
Bundler.setup :development

require 'simplecov'
SimpleCov.start

require 'httpygmy'
require 'webmock/rspec'
include WebMock::API

