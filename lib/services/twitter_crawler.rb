module Services
  class TwitterCrawler
    def crawl_twitters
      usernames = UsernameGenerator.new.generate
      users = usernames.map do |user|
        client.user(user)
      end
      save_users users
    end

    private

    def client
      Rails.application.twitter_client
    end

    def save_users(users)
      users.each do |user|
        u = User.from_twitter(user)
        u.save!
      end
    end
  end
end
