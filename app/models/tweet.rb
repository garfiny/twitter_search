class Tweet < ActiveRecord::Base
  belongs_to :user
  belongs_to :trend

  def self.from_twitter(tweet)
    t = Tweet.new
    t.text = tweet.full_text
    t.uri  = tweet.uri
    t.iso_language_code = tweet.lang
    t
  end
end
