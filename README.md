twitter_search
==============

solr based tweets search demo

## Setup the environment
* Bundle install
* RAILS_ENV=test rake db:migrate
* bundle exec rake spec
* rake db:migrate
* bundle exec rake sunspot:solr:start
* bundle exec rails s
