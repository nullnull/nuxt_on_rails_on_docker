# Docker + Rails + Nuxt.js
[![CircleCI](https://circleci.com/gh/nullnull/nuxt_on_rails_on_docker.svg?style=svg)](https://circleci.com/gh/nullnull/nuxt_on_rails_on_docker)
[![Maintainability](https://api.codeclimate.com/v1/badges/2e1f1bb8632cdfa0923e/maintainability)](https://codeclimate.com/github/nullnull/nuxt_on_rails_on_docker/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2e1f1bb8632cdfa0923e/test_coverage)](https://codeclimate.com/github/nullnull/nuxt_on_rails_on_docker/test_coverage)

A powerful template with the minimun you need to start to work with Rails 5.2 + Nuxt.js 2.0 :tada:
Please clone this repository and use as starter template if you want to save your time.

This repository contains following settings.

* Nuxt.js 2.0 (with SSR)
* Ruby on Rails 5.2 (as API Server)
* Docker
* settings for Google Kubernetes Engine
* CircleCI, Code Climate
* RSpec + Capybara + Selenium + Headless Google Chrome (for E2E testing)


## Setup for local development
Please install [Docker](https://store.docker.com/search?type=edition&offering=community) on your local environment before setup.

```sh
$ git clone git@github.com:nullnull/nuxt_on_rails_on_docker.git
$ cd nuxt_on_rails_on_docker
$ docker-compose build
$ docker-compose run --rm rails bin/setup
$ docker-compose run --rm nuxt yarn install
$ docker-compose up -d
$ open http://localhost:3000 # nuxt
$ open http://localhost:5000/users # rails
```

To shutdown server and remove containers

```sh
$ docker-compose down
```


## Testing on local environment
```sh
$ docker-compose rails bundle exec rspec spec
```

### Feature Spec
You can use [VNC server](https://qiita.com/yszk0123/items/840f16ed388fb52b0e21) to monitor selenium while testing. Run `open vnc://localhost:5900/` and type `secret` for password.


## Deploy to Google Kubernetes Engine(GKE)
Before deployment, please setup your settings for GKE and CloudSQL.

```bash
sh kube/deploy.sh
```
