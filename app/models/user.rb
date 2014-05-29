class User
  attr_accessor :description, :lang, :location, :name
  attr_accessor :screen_name, :time_zone, :withheld_in_countries

  def self.from_twitter(twitter_user)
    user = self.new
    user.description = twitter_user.description
    user.lang        = twitter_user.lang
    user.location    = twitter_user.location
    user.name        = twitter_user.name
    user.screen_name = twitter_user.screen_name
    user.time_zone   = twitter_user.time_zone
    user.withheld_in_countries = twitter_user.withheld_in_countries
    user
  end
end
