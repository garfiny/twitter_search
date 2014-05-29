require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'twitter'

Bundler.require(*Rails.groups)

module TwitterSearch
  class Application < Rails::Application

    console do
      require 'pry'
      config.console = Pry
      unless defined? Pry::ExtendCommandBundle
        Pry::ExtendCommandBundle = Module.new
      end
      require 'rails/console/app'
      require 'rails/console/helpers'
      TOPLEVEL_BINDING.eval('self').extend ::Rails::ConsoleMethods
    end

    def twitter_client
      @twitter_client ||= Twitter::REST::Client.new do |config|
        config.consumer_key    = secrets.twitter_consumer_key
        config.consumer_secret = secrets.twitter_consumer_secret
      end
    end
  end
end
