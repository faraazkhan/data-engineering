require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module DataImporter
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec
    end
    config.secret_key_base = 'mSZgyGcOavIwyvy_EdlpwQ'
  end
end
