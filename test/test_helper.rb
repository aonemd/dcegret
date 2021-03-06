ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'mocha/minitest'

Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods
end

module ActionDispatch
  class IntegrationTest
    include JSONResponse
    include AuthenticatedToken
  end
end
