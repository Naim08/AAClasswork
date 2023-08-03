
# SQLObject

`SQLObject` is a class that provides an interface for interacting with a database table. The class uses the `db_connection` module to connect to the database and execute SQL queries. The `active_support/inflector` module is also required to convert class names to table names.

## Installation

To use `SQLObject`, you'll need to require the `db_connection` and `active_support/inflector` modules in your code:

```ruby
require_relative 'db_connection'
require 'active_support/inflector'
```

## Usage

### Defining a Model

To define a model that inherits from `SQLObject`, you'll need to define a class and set the table name:

```ruby
class MyModel < SQLObject
  self.table_name = 'my_table'
end
```

### Retrieving Data

To retrieve all rows from the table, you can use the `all` method:

```ruby
MyModel.all
```

To retrieve a single row by its `id`, you can use the `find` method:

```ruby
MyModel.find(1)
```

### Creating and Updating Data

To create a new row in the table, you can create a new instance of the model and call the `save` method:

```ruby
my_model = MyModel.new(column1: 'value1', column2: 'value2')
my_model.save
```

To update an existing row in the table, you can retrieve the row by its `id`, update the attributes, and call the `save` method:

```ruby
my_model = MyModel.find(1)
my_model.column1 = 'new_value1'
my_model.save
```

### Defining Attributes

To define attributes for your model, you'll need to define columns in your database table. You can retrieve the column names for your table using the `columns` method:

```ruby
MyModel.columns
```

To define getter and setter methods for each attribute, you can call the `finalize!` method:

```ruby
class MyModel < SQLObject
  self.table_name = 'my_table'

  finalize!
end
```

### Customizing Table Names

By default, `SQLObject` will use the pluralized, underscored version of the class name as the table name. You can customize the table name by setting the `table_name` attribute:

```ruby
class MyModel < SQLObject
  self.table_name = 'my_custom_table_name'
end
```

### Defining Associations

To define a `belongs_to` association, you can call the `belongs_to` method and pass in the name of the association and any options:

```ruby
class Post < SQLObject
  belongs_to :author, foreign_key: :author_id
end
```

To define a `has_many` association, you can call the `has_many` method and pass in the name of the association and any options:

```ruby
class Author < SQLObject
  has_many :posts, foreign_key: :author_id
end
```

### Retrieving Data

To retrieve all rows from a table, you can use the `all` method:

```ruby
Post.all
```

To retrieve a single row by its `id`, you can use the `find` method:

```ruby
Post.find(1)
```

### Creating and Updating Data

To create a new row in the table, you can create a new instance of the model and call the `save` method:

```ruby
post = Post.new(title: 'My Post', body: 'This is my post.')
post.save
```

To update an existing row in the table, you can retrieve the row by its `id`, update the attributes, and call the `save` method:

```ruby
post = Post.find(1)
post.title = 'New Title'
post.save
```

### Defining Attributes

To define attributes for your model, you'll need to define columns in your database table. You can retrieve the column names for your table using the `columns` method:

```ruby
Post.columns
```
