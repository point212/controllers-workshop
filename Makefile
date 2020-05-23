.PHONY: app test
UID=$(shell id -u)
USRENAME=`id -un`
USER_PARAM=--user $(shell id -u):$(shell id -g)
APP_VOLUME_PARAM=-v `pwd`/.:/app
APP_PORT_PARAM=-p 80:3000/tcp
CONTAINER_NAME=dixy_backend/ruby25
DOCKER_RUN=docker run -it ${USER_PARAM} ${APP_VOLUME_PARAM} ${APP_PORT_PARAM} ${CONTAINER_NAME}
DOCKER_COMPOSE_RUN=docker-compose run ${USER_PARAM} app

setup: 	build requirements newapp setup_db

requirements: install-rails install-simpleform install-haml install-pry install-powerassert run-bundler

build:
	docker-compose build --no-cache --force-rm --build-arg UID=${UID} --build-arg USER=${USER} app

install-rails:
	${DOCKER_COMPOSE_RUN} /bin/sh -c "cd /app && gem install bundler:2.0.2 && gem install rails"

install-simpleform:
	${DOCKER_COMPOSE_RUN} /bin/sh -c "rails app:template LOCATION='https://railsbytes.com/script/VQLslK'"

install-haml:
	${DOCKER_COMPOSE_RUN} /bin/sh -c "rails app:template LOCATION='https://railsbytes.com/script/x7msKK'"

install-pry:
	${DOCKER_COMPOSE_RUN} /bin/sh -c "rails app:template LOCATION='https://railsbytes.com/script/V2Gs4X'"

install-powerassert:
	${DOCKER_COMPOSE_RUN} /bin/sh -c "rails app:template LOCATION='https://railsbytes.com/script/xjNsY4'"

run-bundler:
	${DOCKER_COMPOSE_RUN} /bin/sh -c "cd /app && bundle install"

newapp:
	${DOCKER_COMPOSE_RUN} /bin/sh -c "rails new . --skip-action-mailer --skip-action-mailbox   --skip-action-text --skip-active-storage  --skip-action-cable --skip-turbolinks"

migrate:
	${DOCKER_COMPOSE_RUN} /bin/sh -c "bundle exec rake db:migrate"

setup-db:
	${DOCKER_COMPOSE_RUN} /bin/sh -c "bundle exec rake db:create db:migrate db:seed"


sh:
	${DOCKER_COMPOSE_RUN} /bin/bash -l

console:
	${DOCKER_COMPOSE_RUN} rails console

root-sh:
	docker run -it ${APP_VOLUME_PARAM} ${APP_PORT_PARAM} ${CONTAINER_NAME} /bin/bash

up:
	docker-compose up

down:
	docker-compose down

test:
	${DOCKER_COMPOSE_RUN} bundle exec rspec -f d spec/

lint:
	${DOCKER_COMPOSE_RUN} rubocop -C false -c .rubocop.yml

edit-credentials:
	docker-compose run ${USER_PARAM} -e EDITOR=vim app rails credentials:edit