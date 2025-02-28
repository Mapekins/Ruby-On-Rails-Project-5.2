FROM ruby:2.6.10
WORKDIR /app
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nodejs -y
RUN apt-get install postgresql-client -y
COPY Gemfile Gemfile.lock ./
RUN gem update --system 3.2.3
RUN gem install bundler -v 2.4.22
RUN bundle install
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]