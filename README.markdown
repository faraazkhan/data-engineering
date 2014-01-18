# Challenge for Software Engineer - ROR Solution with OpenID Authentication

This is a simple ROR application built with Ruby 2.0.0 and Rails 4.0.2.
It uses the SQLite database. 

## Prerequisites:
[Ruby 2.0.0](https://www.ruby-lang.org/en/downloads/) must be installed ()
[SQLIte](http://www.sqlite.org/download.html) must be installed
## Installation
Clone this repo using instructions on Github
cd into the data-importer directory
and run 
```
bundle install
bundle exec rake db:create 
bundle exec rake db:migrate
bundle exec rake db:test:prepare
```
Then run the test suite with 

```
bundle exec rspec
```
To start the server run:
``` 
bundle exec rails s
```


