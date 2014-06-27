class TwitterSearchController < ApplicationController

  def search
    r = User.search do
      with :screen_name, params[:topic]
    end
    render 'twitter_search/search_result'
  end
end
