require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    if @column.nil?
      colume_string = DBConnection.execute2("SELECT * FROM #{self.table_name}")
      @column = colume_string.first.map &:to_sym
    end
    @column
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def self.finalize!

    self.columns.each do |column|
      #  getter
      define_method(column) do
        attributes[column]
      end
      #  setter
      define_method("#{column}=") do |value|
        attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name ||= self.to_s.tableize
  end

  def self.all
    # ...
    db_result = DBConnection.execute("SELECT * FROM #{table_name}")
    parse_all(db_result)
  end

  def self.parse_all(results)
    # ...
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    # ...
    db_result = DBConnection.execute("SELECT * FROM #{table_name} WHERE id = ?", id)
    parse_all(db_result).first
  end

  def initialize(params = {})
    self.class.finalize!
    @columns = self.class.columns
    params.keys.map &:to_sym
    params.each do |k, v|
      if @columns.include?(k.to_sym)
        self.send("#{k}=", v)
      else
        raise "unknown attribute '#{k}'"
      end
    end
    # ...
  end

  def attribute_values
    # ...
    self.class.columns.map { |column| self.send(column) }
  end

  def insert
    # ...
    col_names = self.class.columns.join(", ")
    questions = []
    self.class.columns.length.times do
      questions << "?"
    end
    question_marks = questions.join(", ")

    DBConnection.execute(<<-SQL, attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    sets = []
    self.class.columns.each_with_index do |column, i|
      next if i == 0
      sets << "#{column} = ?"
    end
    sets = sets.join(", ")
    self_values = attribute_values
    self_id = self_values.shift

    DBConnection.execute(<<-SQL, self_values, self_id)
      UPDATE
        #{self.class.table_name}
      SET
        #{sets}
      WHERE
        id = ?
    SQL
  end

  def save
    # ...
    if self.class.find(self.id)
      update
    else
      insert
    end
  end
end
