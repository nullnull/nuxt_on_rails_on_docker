FROM nuxt_on_rails_on_docker_rails:latest

COPY . $APP_ROOT

RUN bundle install --jobs=4
CMD bundle exec rails server
