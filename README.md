neo_hubway
==========

Hubway Challenge dataset into a Neo4j graph database

Installation
----------------

    git clone git@github.com:maxdemarzi/neo_hubway.git
    bundle install
    rake neo4j:install
    rake neo4j:start
    rackup

On Heroku
---------

    git clone git@github.com:maxdemarzi/neo_hubway.git
    heroku apps:create neohubway
    heroku addons:add neo4j
    git push heroku master

See it running live at http://neohubway.heroku.com

![Screenshot](https://raw.github.com/maxdemarzi/neo_hubway/master/screen_shot.png)