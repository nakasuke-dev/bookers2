FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /bookers2
WORKDIR /bookers2
COPY Gemfile /bookers2/Gemfile
COPY Gemfile.lock /bookers2/Gemfile.lock
RUN bundle install
COPY . /bookers2

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]