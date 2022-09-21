# README

## Requirements to Run

Ruby 3.1.2 / Rails 7.0.4

This application relies on postgres and redis to function - even in development.

It is also configured to be able to run in a devcontainer, if that sort of thing is of interest to you.

To run in a dev container, the `cable.yml` file will need the url changed to point to the host `cache`, like so:
```
development:
  adapter: redis
  url: redis://cache:6379/1
```

Additionally, if running in a dev container, the default database configuration will need to be:
```
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: postgres
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

```

## User authentication / signup

Confirmable is turned off at present for users, so sign up with whatever email you'd like.  There are no roles at present, everyone may make or watch presentations.

To present something, make a slideshow, then present it.  Share the link to the presentation, or let people find it from the home page.
