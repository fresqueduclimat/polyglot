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


# WORKDIR /app
# ADD . ./

# RUN apt update -qq && \
#   apt install -y --no-install-recommends build-essential libpq-dev curl && \
#   curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && \
#   apt-key add /root/yarn-pubkey.gpg && \
#   echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
#   apt update && \
#   apt install -y --no-install-recommends nodejs yarn && \
#   apt clean && rm -rf /var/lib/apt/lists/*

# RUN bundle install -j $(nproc)

# RUN yarn install --ignore-scripts

# RUN chmod +x ./infra/scripts/startup_polyglot.sh
# ENTRYPOINT [ "./infra/scripts/startup_polyglot.sh" ]

# EXPOSE 3000

# CMD ["rails", "-p", "3000", "server", "-b", "0.0.0.0", "-e", "production"]
