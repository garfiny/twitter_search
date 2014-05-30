module Services
  class TwitterCrawler
    def crawl_twitters(progressable = nil)
      usernames = UsernameGenerator.new.generate
      progressable.init(usernames.size) unless (progressable.nil?)
      usernames.map do |user|
        save_user(client.user(user))
        progressable.make_progress unless progressable.nil?
      end
    rescue => e
      unless progressable.nil?
        progressable.mark_done_with_errors(e.message) 
      end
    end

    def crawl_tweets(progressable = nil)
    end

    private

    def client
      Rails.application.twitter_client
    end

    def save_user(user)
      User.from_twitter(user).save!
    end
  end
end
