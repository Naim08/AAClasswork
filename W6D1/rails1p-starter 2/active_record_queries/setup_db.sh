#!/usr/bin/env sh

rails db:reset
rails db:environment:set RAILS_ENV=test
RAILS_ENV=test rails db:schema:load
RAILS_ENV=test rails db:seed