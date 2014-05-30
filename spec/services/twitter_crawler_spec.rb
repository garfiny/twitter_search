require 'spec_helper'

describe Services::TwitterCrawler do
  describe '#crawl_twitters' do
    let(:limit) { APP_CONFIG[:usernames_gen_limits] }

    def random_user
      double("TwitterUser", 
             name: Faker::Name.name,
             description: Faker::Lorem.paragraph,
             lang: %w(en zh-cn es).sample,
             location: Faker::Address.city,
             screen_name: Faker::Name.first_name,
             time_zone: Time.now.zone,
             withheld_in_countries: "GR, HK, MY"
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

    it 'uses progressable to report progress' do
      p = Services::Progressable.new
      p.should_receive(:init)
      p.should_receive(:make_progress).exactly(limit).times
      subject.crawl_twitters(p)
    end

    it 'mark errors when exception raised' do
      p = Services::Progressable.new
      User.stub(:from_twitter) { raise "something wrong" }
      p.should_receive(:mark_done_with_errors)
      subject.crawl_twitters(p)
    end
  end

  describe '#crawl_tweets' do
  end
end
