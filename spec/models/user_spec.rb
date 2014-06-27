require 'rails_helper'

describe User do
  let(:user_attributes) { attributes_for(:user) }
  let(:twitter_user) { double(:twitter_user) }
  before do
    allow(twitter_user).to receive(:description) { user_attributes[:description] }
    allow(twitter_user).to receive(:lang) { user_attributes[:lang] }
    allow(twitter_user).to receive(:location) { user_attributes[:location] }
    allow(twitter_user).to receive(:name) { user_attributes[:name] }
    allow(twitter_user).to receive(:screen_name) { user_attributes[:screen_name] }
    allow(twitter_user).to receive(:time_zone) { user_attributes[:time_zone] }
  end

  describe '.from_twitter' do
    context 'create new user from twitter user' do
      subject { User.from_twitter(twitter_user) }
      it { expect(subject.description).to eq(user_attributes[:description]) }
      it { expect(subject.lang).to eq(user_attributes[:lang]) }
      it { expect(subject.location).to eq(user_attributes[:location]) }
      it { expect(subject.name).to eq(user_attributes[:name]) }
      it { expect(subject.screen_name).to eq(user_attributes[:screen_name]) }
      it { expect(subject.time_zone).to eq(user_attributes[:time_zone]) }
    end
  end
end
