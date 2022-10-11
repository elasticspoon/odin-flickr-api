# [Odin-flickr-api README](https://odin-flickr-api.onrender.com/)

- [Odin-flickr-api README](#odin-flickr-api-readme)
  - [About the project](#about-the-project)
  - [Tech stack](#tech-stack)
  - [Getting the site running](#getting-the-site-running)
    - [Testing](#testing)
  - [Running in production](#running-in-production)
  - [Goals](#goals)

## About the project

Link to site: [https://odin-flickr-api.onrender.com/](https://odin-flickr-api.onrender.com/)

![Flick API site screenshot](https://raw.githubusercontent.com/elasticspoon/odin-flickr-api/main/flickr-site-screenshot.png)

Odin Flickr project is a basic rails site that allows the user to input the `user_id` of a Flickr user and then shows the 5 most recent public pictures they uploaded.

The site uses Rails with no database, serving a server rendered page and has a small wrapper around the `flickr-objects` gem to access the Flickr public API.

## Tech stack

Ruby on Rails, PostCSS, Open Props, Render

## Getting the site running

Since this is a site that uses the Flickr API you will need an access token, so head on over to [the site](https://www.flickr.com/services/apps/create/apply/) and get an API key.

Next you will need to get the application installed locally.

```bash
git clone git@github.com:elasticspoon/odin-flickr-api.git
cd odin-flickr-api
bundle install
bundle exec figaro install
```

Now `cofig/application.yml` and add your API key and secret.

```yaml
# config/application.yml
flickr_api_key: "SOMEAPIKEY"
flickr_api_secret: "SOMESERCET"
```

You will now be able to reference those values as either `ENV['key_value']` or `Figaro.env.key_value`.

Finally, we can run the server:

```bash
bin/dev
# you may want to run the server more simply
# if you dont need vscode debugging and watching for changes
bundle exec rails s -p 3000
```

### Testing

Tests are written written in RSpec, only the models are covered by tests.

```bash
bundle exec rspec
```

## Running in production

Assuming you already have your environment variables configured in the `figaro` gem it only takes two commands to get the server running in production at `localhost:3000`.

```bash
rails assets:precompile
bundle exec rails s -e production -p 3000
```

## Goals

The goal of this project was to create a simple Rails application that would be able to interact with the Flickr public API.

I had several personal goals for the project where I wanted to try some new technologies at all the layers of the stack. On the front end I used the open props library to style my front end, I launched the site on a new service (Render) and used a new gem to store environmental variables.
