require_relative "db_connection"
require "active_support/inflector"
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.
# Use DBConnection
class SQLObject
  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.columns
    return @columns if @columns

    cols = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{table_name}
      LIMIT 0
    SQL

    @columns = cols.first.map(&:to_sym)
  end


  def self.finalize!
    self.columns.each do |column|
      define_method(column) do
        self.attributes[column]
      end

      define_method("#{column}=") do |val|
        self.attributes[column] = val
      end
    end
  end

  # all does not cache the results of the query
  def self.all
    @@all = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{table_name}
    SQL
    self::parse_all(@@all)

  end

  def self.parse_all(results)

    results.map { |result| self.new(result) }
  end

  def self.find(id)
    self.all.find { |obj| obj.id == id }
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map { |attr_name| self.send(attr_name) }
  end

# Example below:
#INSERT INTO
#   table_name (col1, col2, col3)
# VALUES
#   (?, ?, ?)
  def insert
    col_names = self.class.columns.join(", ")
    question_marks = (["?"] * self.class.columns.length).join(", ")
    DBConnection.execute2(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  #updates attributes to DB
  #UPDATE
  # table_name
  # SET
  #   col1 = ?, col2 = ?, col3 = ?
  # WHERE
  #   id = ?

  def update
    set_line = self.class.columns
      .map { |attr_name| "#{attr_name} = ?" }.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values, self.id)
      UPDATE #{self.class.table_name}
      SET #{set_line}
      WHERE id = ?
    SQL

  end

  #save to DB, insert when record
  def save
    id.nil? ? insert : update

  end
end
