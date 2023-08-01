#!/usr/bin/env sh

chmod +x bin/*
rails db:drop
rails db:create
rails db:schema:load
rails db:environment:set RAILS_ENV=test
RAILS_ENV=test rails db:schema:load