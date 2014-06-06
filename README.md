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

## To be Done!
* load tweets
* load facebook
* load YouTube
* load Google+
* load github
* find other social network web sites
* Perform same search based on RDBMS/Document-Oriented NoSQL/FullText search engine - Solr|ElasticSearch
