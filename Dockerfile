FROM ruby:3.1.2
LABEL Sergio López <lopez.sergio.n@gmail.com>

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn tzdata npm

ARG UNAME=default
ARG UID=1000
ARG GID=1000

RUN echo "GID=$GID, UNAME=$UNAME, UID=$UID"
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME


WORKDIR /usr/src/app

RUN chown -R default:default /usr/src/app
USER default

RUN gem install foreman

COPY --chown=default:default Gemfile Gemfile.lock package.json package-lock.json /usr/src/app/
RUN bundle install

RUN bundle exec vite install


#Add a script to be executed every time the container starts.
COPY --chown=default:default ./.docker/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN npm install

ENTRYPOINT ["entrypoint.sh"]