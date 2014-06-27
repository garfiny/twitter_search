module Services
  class TwitterCrawler
    def crawl_twitters(progressable = nil)
      usernames = UsernameGenerator.new.generate
      progressable.init(usernames.size) unless (progressable.nil?)
      usernames.each do |user|
        twitter_user = begin
                         client.user(user)
                       rescue => ex
                         nil
                       end
        save_user(twitter_user) unless twitter_user.nil?
        progressable.make_progress(user) unless progressable.nil?
      end
    rescue => e
      unless progressable.nil?
        progressable.mark_done_with_errors(e.message) 
      end
    end

    def crawl_trends(progressable = nil)
      client.trends.each do |t|
        save_tweet(t)
        progressable.make_progress(t) unless progressable.nil?
      end
    rescue => e
      unless progressable.nil?
        progressable.mark_done_with_errors(e.message) 
      end
    end

    private

    def client
      Rails.application.twitter_client
    end

    def save_user(user)
      User.from_twitter(user).save(validate: false)
    end

    def save_tweet(tweet)
      Tweet.from_twitter(tweet).save(validate: false)
    end
  end
end
