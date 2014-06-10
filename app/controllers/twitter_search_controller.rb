class TwitterSearchController < ApplicationController

  def search
    r = User.search do
      with :screen_name, params[:topic]
    end
    binding.pry
    render 'twitter_search/search_result'
  end
end
