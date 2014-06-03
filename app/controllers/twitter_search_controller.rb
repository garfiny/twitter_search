class TwitterSearchController < ApplicationController

  def search
    p params[:topic]
    User.search do

    end
    render 'twitter_search/search_result'
  end
end
