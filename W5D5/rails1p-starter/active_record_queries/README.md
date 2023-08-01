# Rails 1 Practice - Active Record Querying

This section of the evaluation will assess your ability to write Active Record
queries. It is estimated to take **25 minutes**.

## Setup

**NB: Run `bundle install` before you get started.**

Next, set up the database:

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

## Objective

The objective for this portion of the test is to pass the specs found in the
__spec__ directory.

The problems will be found in the __problems/ar_queries.rb__ file. There are 10
total specs given in the __spec__ directory. Your objective is to pass as many
specs as possible.

## Running Specs

- `bundle exec rspec` to run the entire spec suite
- `bundle exec rspec spec/<spec_file_name>` to run all specs in a given spec
  file
  - for example: `bundle exec rspec spec/ar_queries_spec.rb`
- `bundle exec rspec spec/<spec_file_name>:<line_number>` to run the spec(s) in
  the block that contains the given line number of the given spec file
  - for example: `bundle exec rspec spec/ar_queries_spec.rb:101`

**Copyright App Academy. Please do not post online.**