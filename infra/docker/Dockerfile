FROM ruby:3.3.0

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn
WORKDIR /app
ADD . ./

RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install
RUN bundle exec rails assets:precompile

RUN chmod +x ./infra/scripts/startup_polyglot.sh
ENTRYPOINT [ "./infra/scripts/startup_polyglot.sh" ]

EXPOSE 3000

CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0", "-e", "production"]
