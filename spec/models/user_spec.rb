require 'spec_helper'

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
    subject           { User.from_twitter(twitter_user) }
    its(:description) { should == user_attributes[:description] }
    its(:lang)        { should == user_attributes[:lang] }
    its(:location)    { should == user_attributes[:location] }
    its(:name)        { should == user_attributes[:name] }
    its(:screen_name) { should == user_attributes[:screen_name] }
    its(:time_zone)   { should == user_attributes[:time_zone] }
  end
end
