class TwitterLoaderController < ApplicationController
  include CrawlerMonitor

  helper ApplicationHelper

  def load_users
    crawl_twitters
    respond_to do |format|
      format.js
    end
  end

  def show_progress
    respond_to do |format|
      format.json { render json: monitor_progress.to_json }
    end
  end

  private

  def crawl_twitters
    Thread.new { 
      crawler.crawl_twitters progress_reporter("twitter crawler")
    }
  end

  def crawler
   @crawler ||= Services::TwitterCrawler.new
  end
end
