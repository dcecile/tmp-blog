# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Developing

1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
2. Run `gem install bundler` to install project gem manager
3. Run `bundler install --without production` to install project gems
4. Run `overcommit --install` to enable Git hooks
5. Run `bin/rails db:migrate` to set up the database
6. Run `bin/rails server` to start up Rails
7. Visit http://localhost:3000 to view the app

## Deploying

1. Install [Heroku CLI tools](https://devcenter.heroku.com/articles/heroku-cli)
2. Run `heroku create` to initialize the Heroku app
3. (Optional) Run `heroku apps:rename NEWNAME` to rename your app
4. Run `git push heroku master` to push code to the Heroku app
5. Run `heroku run rails db:migrate` to set up the database
6. (Optional) Run `heroku addons:open scheduler` to open the Heroku scheduler dashboard, then set up an hourly task for `rails scheduler:destroy_all_old` to periodically refresh the database
7. Run `heroku open` to visit the website
