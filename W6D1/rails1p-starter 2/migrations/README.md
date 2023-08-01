# Rails 1 Practice - Migrations

This section of the evaluation assesses your ability to write Active Record
migrations. It is estimated to take **15 minutes**.

## Setup

**NB: Run `bundle install` before you get started.**

Next, set up the database:

  ```sh
  sh setup_db.sh
  ```

**IMPORTANT!!!!**
Run this script before writing any code or running any terminal commands besides
`bundle install`.

> **Note:** By default, when you run `rails db:migrate`, Rails runs the
> migrations on the development database. The specs, however, run against the
> test database. How does this work??? The line
> `ActiveRecord::Migration.maintain_test_schema!` in __spec/rails_helper.rb__
> ensures that any migrations that have not yet been run on the test database
> will be run on the test database before the specs are tested.

If your __schema.rb__ is emptied for any reason, copy the contents of
__schema_copy.rb__ into __schema.rb__ and re-run the setup script.

## Overview

Welcome to VideoTube part 1! You've been tasked to create a website for users to
upload their favorite videos. Every user can also leave likes and/or comments on
each video.

## Assignment

Your task is to create the migrations to help finish the current schema for your
application. The database has been partially set up, but you'll need to edit
some columns on existing tables and create a new table for comments.

Make sure to look at the specs and the __schema_goal.md__. Part of your job is
to be able to understand the desired structure of the database from these
resources. __schema_goal.md__ will be your main reference for correcting the
database schema. (Use `shift + cmd + V` to preview markdown files on Mac, `shift
+ ctrl + V` on Windows and Linux.) The specs (`bundle exec rspec`) will also
guide you to the needed changes.

You are encouraged to start by generating a migration to create the `comments`
table. Make sure to run `bundle exec rails db:migrate` before running the specs.
After creating the `comments` table, generate another migration to make the
appropriate changes to the `users` and `videos` tables.

**Copyright App Academy. Please do not post online.**