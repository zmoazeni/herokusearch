# Getting started

This is a typical Rails v3.2 app.

You will need both postgresql and elasticsearch installed from homebrew:

    brew update
    brew install postgresql
    brew install elasticsearch
    brew install heroku-toolbelt

Then set up the rails app:

    bundle                      # install the bundle gems
    bundle exec rake db:create  # create the databases from config/database.yml
    bundle exec rake db:migrate # migrate

Install powify and connect this app to pow:

    gem install powify
    powify create
    powify browse

# Deploying to Heroku

Create a heroku instance:

    heroku apps:create          # creates a new heroku instance
    heroku addons:add searchbox # adds the searchbox ES add-on service
    git push heroku master      # deploy to heroku


Now the code is on heroku you need to migrate and check to see if things
are hooked up:

    heroku run rake db:migrate # creates the necessary tables


    heroku run console
    > Person.index.create                         # creates the ES index for the People table
    > Person.search("foo", :load => true).results # searches for any People with the name "foo"

    > Person.create!(:name => "Foo Johnson")      # creates a person with a name "foo"
    > Person.search("foo", :load => true).results # returns the person we just created


