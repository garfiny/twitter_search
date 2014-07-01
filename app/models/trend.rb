class Trend < ActiveRecord::Base

  has_many :tweets

  def self.from_twitter(trend)
    t = Trend.new
    t.events = trend.events
    t.name   = trend.name
    t.query  = trend.query
    t.url    = trend.url.to_s
    t
  end
end
