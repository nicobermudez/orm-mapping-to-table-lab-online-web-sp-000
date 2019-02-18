# Remember, you can access your database connection anywhere in this class
#  with DB[:conn]

class Student
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade, id=nil)
    @name=name
    @grade=grade
  end

  def save
    sql = <<-SQL
  INSERT INTO songs (name, album)
  VALUES (?, ?)
  SQL
  DB[:conn].execute(sql, self.name, self/grade)
  end

  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS songs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        album TEXT
        )
        SQL
    DB[:conn].execute(sql)
  end
end
