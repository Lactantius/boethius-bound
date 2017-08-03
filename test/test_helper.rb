# ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

end

class ActionDispatch::IntegrationTest

  def login user
    post user_session_url, params: {
      session: {
        email: user.email,
        encrypted_password: user.encrypted_password
      }
    }
  end

end
    
