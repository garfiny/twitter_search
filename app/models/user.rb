class User < ActiveRecord::Base

  def self.from_twitter(twitter_user)
    user = self.new
    user.description = twitter_user.description
    user.lang        = twitter_user.lang
    user.location    = twitter_user.location
    user.name        = twitter_user.name
    user.screen_name = twitter_user.screen_name
    user.time_zone   = twitter_user.time_zone
    user
  end
end
