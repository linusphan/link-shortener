# Link Shortener

## Overview
This is a link shortener application built using Ruby on Rails that has test
coverage and uses Postgres. The application takes into account scalability and
is built to handle 1k new urls a day, where each url gets hit 20k times a day.


## Getting Started

### How to set up the application on development server
- Run `bundle install` from the root directory to install
  ruby dependencies
- Run `rails db:setup` to setup the database
- Run `bin/rails server` or `rails s` to start a web server on your development
  machine to see/start the Rails application
- Navigate your browser to localhost:3000

-------------------------------------------------------------------------------
## Documentation

### Features

1. Root renders a form in which you can drop a URL. When you do,
   you'll get redirected to a page with its shortened URL and an admin URL.
2. When you go to a shortened URL, you get redirected to the
   original URL that was submitted, as long as the URL is active. Usage is also
   counted.
3. When you go to the Admin URL, you are given the ability to
   expire the shortened link and see how many times your link has been used.
   When a link has been expired, an empty 404 gets rendered.

### Database Schema

![short_links](https://user-images.githubusercontent.com/13613724/58852469-8b584d80-864b-11e9-8731-39985ab5c589.png)

The database layer is very simple. It only has one table: it stores information
about the URL mappings. To keep things simple, there is no user table to keep
track of registered users. Meaning, there is no user registration implemented
for this app.
