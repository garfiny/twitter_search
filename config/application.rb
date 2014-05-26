require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'twitter'

Bundler.require(*Rails.groups)

module TwitterSearch
  class Application < Rails::Application

    def twitter_client
      @twitter_client ||= Twitter::REST::Client.new do |config|
        config.consumer_key    = secrets.twitter_consumer_key
        config.consumer_secret = secrets.twitter_consumer_secret
      end
    end
  end
end
