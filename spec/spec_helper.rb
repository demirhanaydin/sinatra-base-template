# Set the rack environment to `test`
ENV['RACK_ENV'] = 'test'

# Pull in all of the gems including those in the `test` group
require 'bundler'
Bundler.require :default, :test

# Require test libraries
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'mocha/setup'
require 'rack/test'

include Rack::Test::Methods

# Load the sinatra app
require_relative '../app'

# Load the unit helpers
require_relative 'support/unit_helpers'

def app
  Sinatra::Application
end

class UnitTest < MiniTest::Spec
  include UnitHelpers

  # Any test that ends with 'Unit|Spec|Model' is a `UnitTest`
  register_spec_type(/(Unit|Spec|Model)$/, self)

  # Any test that is a class rather than a string is also a `UnitTest`
  register_spec_type(self) do |desc|
    true if desc.is_a?(Class)
  end
end