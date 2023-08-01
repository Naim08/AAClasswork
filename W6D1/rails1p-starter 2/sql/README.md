# Rails 1 Practice - SQL

This section of the evaluation assesses your ability to work with raw SQL. It is
estimated to take **20 minutes**.

## Setup

**N.B.: Run `bundle install` before you get started.**

Next, run the following script in the SQL home directory to setup the DB:

  ```sh
  sh data/import_cat_db.sh
  ```

**IMPORTANT!!!!**
Run this script before writing any code or running any terminal commands besides
`bundle install`.

If your DB gets corrupted somehow, you can always re-run `data/import_cat_db.sh`
to restore the DB.

## Instructions

Fill in the required SQL in the __lib/test.rb__ file. The spec file (run with
`bundle exec rspec`) will check your work. Remember that you can run individual
specs by including the line number at the end (e.g., run `bundle exec rspec
spec/test_spec.rb:21`). You may wish to use the command-line postgres program to
interactively experiment with SQL, but this is not required. Please do not use
the internet.

Database: `cats` have a name, color, and breed.  `toys` have a name, color, and
price.  `cat_toys` is a join table that references the `cats` table with the
foreign key of `cat_id` and the `toys` table with the foreign key of `toy_id`.

After 20 minutes--or upon completion--you are (very strongly) encouraged to move
on to other parts of Rails 1. You may, of course, return to the SQL portion
after completing the other parts of the test.

## Notes

1. Result ordering matters; the specs will enforce this.
2. Make sure to terminate postgres commands with semicolons; otherwise
   they don't execute.
3. Ask for help if you get stuck!
4. Good luck!

**Copyright App Academy. Please do not post online.**