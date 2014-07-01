require 'rails_helper'

describe Trend, :type => :model do
  let(:trend_attributes) { attributes_for(:trend) }
  let(:twitter_trend) { double(:twitter_trend) }
  before do
    allow(twitter_trend).to receive(:events) { trend_attributes[:events] }
    allow(twitter_trend).to receive(:name)   { trend_attributes[:name] }
    allow(twitter_trend).to receive(:query)  { trend_attributes[:query] }
    allow(twitter_trend).to receive(:url)    { trend_attributes[:url] }
  end

  describe '.from_twitter' do
    context 'create new trend from twitter trend' do
      subject { Trend.from_twitter(twitter_trend) }
      it { expect(subject.events).to eq(trend_attributes[:events]) }
      it { expect(subject.name).to eq(trend_attributes[:name]) }
      it { expect(subject.query).to eq(trend_attributes[:query]) }
      it { expect(subject.url).to eq(trend_attributes[:url]) }
    end
  end
end
