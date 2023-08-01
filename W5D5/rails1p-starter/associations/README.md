# Rails 1 Practice - Associations

This section of the evaluation will assess your ability to write Active Record
associations. It is estimated to take **30 minutes**.

## Setup

**NB: Run `bundle install` before you get started.**

Next, set up the database in both the development and test environments:

  ```sh
  sh setup_db.sh
  ```

**IMPORTANT!!!!** Run this script before writing any code or running any
terminal commands besides `bundle install`. This will ensure that your test
environment is set up and seeded correctly.

> **Note:** The specs will run against the test database. This ensures that your
> specs will still produce accurate results--i.e., the same results the graders
> will get when they run your code against a clean database--even if you (by
> accident or design) end up modifying the data in the development database
> while developing your code.

If your __schema.rb__ is emptied for any reason, copy the contents of
__schema_copy.rb__ into __schema.rb__ and re-run the setup script.

## Overview

Welcome to VideoTube part 2! You've been tasked with creating a website for
users to upload their favorite videos. Every user can also leave likes and/or
comments on each video.

## Assignment

Your task today is to build the relationships between all of the models. The
database has already been set up and the models have been annotated with their
respective table schemas.

Make sure to look at the specs and the schema in **db/schema.rb**. Part of your
job is to be able to understand the structure and interrelations of the data
from these sources. The specs (`bundle exec rspec`) will guide you through
building a series of associations. Refer to the schema to find the format of the
database; this will especially help you find the name of foreign keys.

You are encouraged to start by building `has_many`, `belongs_to`, and `has_one`
associations. Once you've finished those, then build the `has_many :through`
associations.

**Copyright App Academy. Please do not post online.**