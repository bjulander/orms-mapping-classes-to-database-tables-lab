class Student
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade) 
    @id = id
    @name = name 
    @grade = grade
  end

  def self.create_table
    sql = <<-SQL 
    create table students (
      id integer primary key,
      name text,
      grade text
    ) 
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "drop table students"
    DB[:conn].execute(sql)
  end

  def save
    sql = "insert into students (name, grade) values (?, ?)"
    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end

  def self.create(name:, grade:)
    student = Student.new(name, grade)
    student.save
    student


  end
end
