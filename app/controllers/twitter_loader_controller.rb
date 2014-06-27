class TwitterLoaderController < ApplicationController

  helper ApplicationHelper

  def load_users
    crawl_twitters
    respond_to do |format|
      format.js
    end
  end

  def load_trends
    crawl_trends
    respond_to do |format|
      format.js
    end
  end

  def show_progress
    progress = Progress.in_progress
    respond_to do |format|
      format.json { render json: progress.to_json }
    end
  end

  private

  def crawl_twitters
    Thread.new { 
      crawler.crawl_twitters progressable
    }
  end

  def crawl_trends
    Thread.new { 
      crawler.crawl_trends progressable
    }
  end

  def progressable
    Services::ProgressableDb.new
  end

  def crawler
   @crawler ||= Services::TwitterCrawler.new
  end
end
