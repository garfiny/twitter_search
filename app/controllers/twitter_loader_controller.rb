class TwitterLoaderController < ApplicationController

  helper ApplicationHelper

  def load_users
    crawler.crawl_twitters(progress_reporter)
    render nothing: true
  end

  private

  def crawler
   @crawler ||= Services::TwitterCrawler.new
  end

  def progress_reporter
    Services::Progressable.new do |item|
      p "=======#{item.inspect}==============="
    end
  end
end
