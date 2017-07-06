FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential nodejs npm nodejs-legacy mysql-client vim
RUN npm install -g phantomjs

RUN mkdir /mouseCreateReporting

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /mouseCreateReporting
WORKDIR /mouseCreateReporting
RUN RAILS_ENV=production bundle exec rake assets:precompile --trace
EXPOSE 3000

CMD ["rails","server","-b","0.0.0.0"]
