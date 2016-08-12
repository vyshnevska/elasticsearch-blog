ENV["RAILS_ENV"] = 'test'
require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'shoulda-matchers'

require 'simplecov'
SimpleCov.start 'rails'

# Add after other requires. Rake needs to be loaded.
require 'rake'
require 'elasticsearch/extensions/test/cluster/tasks'

RSpec.configure do |config|
  # set to false because we are using database_cleaner
  config.use_transactional_fixtures = false

  config.before :each, elasticsearch: true do
    # DatabaseCleaner.start
    Elasticsearch::Extensions::Test::Cluster.start(port: 9200) unless Elasticsearch::Extensions::Test::Cluster.running?
  end

  config.after :suite do
    # DatabaseCleaner.clean
    Elasticsearch::Extensions::Test::Cluster.stop(port: 9200) if Elasticsearch::Extensions::Test::Cluster.running?
  end
end

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join("spec/shared_examples/**/*.rb")].each { |f| require f }
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
   expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
