FROM ruby:2.3.2-slim
RUN apt-get update -y && \
   apt-get install -y \
   build-essential \
   libssl-dev \
   libyaml-dev \
   git-core \
   joe


RUN gem install bundler
ENV APP_DIR=/code
ENV APP_PORT=4000

ENV LANG=C.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=C.UTF-8
#RUN bundle config $BUNDLE_GEMSERVER__METODA__COM
WORKDIR $APP_DIR
ADD Gemfile $APP_DIR
ADD Gemfile.lock $APP_DIR
RUN bundle install --jobs 4 --retry 3

#ADD . $APP_DIR
#ADD .git_revision $APP_DIR/public/.build_info
#ADD .git_revision $APP_DIR
#RUN mkdir tmp/cache
#RUN RAILS_ENV=production rake assets:precompile --trace
#RUN RAILS_ENV=production rake i18n:js:export --trace

#CMD /bin/bash

