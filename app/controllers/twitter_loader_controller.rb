class TwitterLoaderController < ApplicationController

  helper ApplicationHelper

  def load_users
    crawl_twitters
    respond_to do |format|
      format.js
    end
  end

  def show_progress
    progress = Progress.in_progress
    p progress.to_json
    respond_to do |format|
      format.json { render json: progress.to_json }
    end
  end

  private

  def crawl_twitters
    Thread.new { 
      crawler.crawl_twitters Services::ProgressableDb.new
    }
  end

  def crawler
   @crawler ||= Services::TwitterCrawler.new
  end
end
