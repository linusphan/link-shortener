# Link Shortener

## Overview
This is a link shortener application built using Ruby on Rails that has test
coverage and uses Postgres. The application takes into account scalability and
is built to handle 1k new urls a day, where each url gets hit 20k times a day.
Try out the application at this
[Heroku link](https://link-shortener-linus.herokuapp.com/).

## Getting Started

### How to set up the application on development server
- Run `bundle install` from the root directory to install
  ruby dependencies
- Run `rails db:setup` to setup the database
- Run `bin/rails server` or `rails s` to start a web server on your development
  machine to see/start the Rails application
- Navigate your browser to localhost:3000

--------------------------------------------------------------------------------
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

--------------------------------------------------------------------------------

### Database Schema

![short_links](https://user-images.githubusercontent.com/13613724/58852469-8b584d80-864b-11e9-8731-39985ab5c589.png)

The database layer is very simple. It only has one table: it stores information
about the URL mappings. To keep things simple, there is no user table to keep
track of registered users. Meaning, there is no user registration implemented
for this app.

--------------------------------------------------------------------------------

### Link Shortener Request Flow Diagrams

#### Write Short Link

![write_short_link](https://user-images.githubusercontent.com/13613724/58853544-8f866a00-864f-11e9-8a00-af6a3d733b17.png)

This diagram shows the request flow for creating a new shortened link. The user
sends a request to the link shortener application, computes the business logic,
which then writes to the postgreSQL database the new URL mapping/record.

#### Read Short Link

![read_short_link](https://user-images.githubusercontent.com/13613724/58853635-d6745f80-864f-11e9-8a9a-0dcdd37ac48a.png)

This diagram shows the request flow to request for the original URL from a
shortened URL. The user sends the request to the application, which reads the
original URL based on the unique shortened URL. If the shortened URL existed,
then the client will receive an HTTP 302 Redirect Response. If the shortened
URL did not exist, the user will receive an HTTP 404 Not Found response.

--------------------------------------------------------------------------------
## Helpful Notes

### System Design and Scaling Considerations

Some of the most interesting aspects of software engineering is figuring out the
system design for the application and taking into account scalability as well.
Some of the thoughts regarding these aspects of software engineering has been
documented; see the
[System Design Considerations document](./docs/system_design_considerations.md)
for more information.
