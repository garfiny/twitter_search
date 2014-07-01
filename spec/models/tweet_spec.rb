require 'rails_helper'

describe Tweet, :type => :model do
  let(:tweet_attributes) { attributes_for(:tweet) }
  let(:twitter_tweet) { double(:twitter_tweet) }
  before do
    allow(twitter_tweet).to receive(:full_text) { tweet_attributes[:text] }
    allow(twitter_tweet).to receive(:uri) { tweet_attributes[:uri] }
    allow(twitter_tweet).to receive(:lang) { tweet_attributes[:lang] }
  end

  describe '.from_twitter' do
    context 'create new tweet from twitter tweet' do
      subject { Tweet.from_twitter(twitter_tweet) }
      it { expect(subject.text).to eq(tweet_attributes[:text]) }
      it { expect(subject.iso_language_code).to eq(tweet_attributes[:lang]) }
      it { expect(subject.uri).to eq(tweet_attributes[:uri]) }
    end
  end
end
