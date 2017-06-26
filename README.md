# README

This is small user administrator app, where a user can have one of two roles, the administrator or the normal user. Administrators can list, view, destroy, edit and create normal users.

Environment

* Ruby 2.3.0
* PostgreSQL

Installing and running


```

git clone https://github.com/maroki/admin_user_app.git
cd admin_user_app
bundle install
# set username and password in config/database.yml file
rake db:setup
rake db:seed

rspec # run tests

rails s
```