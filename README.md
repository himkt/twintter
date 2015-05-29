# Twintter

Twintter is a system includes various function: searching, sharing, and talking about a course...

This application is for a main major training in University of Tsukuba, College of knowledge and library science.

## Environment

This app is running on ubuntu 14.05LST in production.

And we develop this app on MacOSX (10.9 and 10.10).

Ruby version: 2.1.4

Rails version: 4.1.2

## install

#### gem

please run to install required gems.

```ruby
bundle install --path vendor/bundle
```

#### create database
```ruby
bundle exec rake db:migrate
```

#### model

make a model for polarity analysis.

```ruby
bundle exec rake build
```

#### subjects data

see https://github.com/himkt/kdb_scraper

I have finished creating document about it.. I'm sorry but please wait...  

After all, please run

```ruby
bundle exec rake seed
```

## run

```ruby
rails s
```
