require 'spec_helper'

describe TwitterLoaderController do

  describe 'GET load_users' do
    before do
      Services::TwitterCrawler.any_instance.stub(:crawl_twitters)
    end

    it 'crawl twitter users' do
      xhr :get, :load_users
      expect(response.status).to eq(200)
    end
  end

end
