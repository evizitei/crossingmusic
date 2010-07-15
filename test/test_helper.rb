ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
#require 'redgreen'
require 'shoulda'
require "shoulda_macros/paperclip"

#include Factory Girl
require 'factory_girl_rails'
Factory.find_definitions

#authlogic support
require "authlogic/test_case"

#timecop support
require 'timecop'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  #fixtures :all

  # Add more helper methods to be used by all tests here...
  def assert_contains(collection,item)
    assert_not_nil collection.index(item)
  end
  
  def assert_does_not_contain(collection,item)
    assert_nil collection.index(item)
  end
end
