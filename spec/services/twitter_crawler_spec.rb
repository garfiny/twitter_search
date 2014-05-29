require 'spec_helper'

describe Services::TwitterCrawler do
  describe '#crawl_twitters' do
    let(:limit) { APP_CONFIG[:usernames_gen_limits] }

    def random_user
      double("TwitterUser", 
             name: Faker::Name.name,
             description: Faker::Lorem.characters
            ).as_null_object
    end

    before do
      allow(Rails.application.twitter_client).to receive(:user) { random_user }
      subject.crawl_twitters
    end

    it 'fetch generated users from twitter' do
      expect(subject.crawl_twitters).to be_kind_of(Array)
      expect(subject.crawl_twitters.size).to eq(limit)
    end

    it 'save the fected users into database' do
      User.count.should == limit
    end

    it 'fetch recent post by crawled users'
  end
end
