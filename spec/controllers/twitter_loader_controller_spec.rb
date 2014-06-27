require 'rails_helper'

describe TwitterLoaderController do

  describe 'GET load_users' do
    before do
      allow_any_instance_of(Services::TwitterCrawler).to receive(:crawl_twitters)
    end

    it 'crawl twitter users' do
      xhr :get, :load_users
      expect(response.status).to eq(200)
    end
  end

  describe 'GET load_trends' do
    before do
      allow_any_instance_of(Services::TwitterCrawler).to receive(:crawl_trends)
    end

    it 'crawl twitter users' do
      xhr :get, :load_trends
      expect(response.status).to eq(200)
    end
  end
end
