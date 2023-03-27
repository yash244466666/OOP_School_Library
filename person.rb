class Person
  attr_accessor :name, :age, :rentals, :id

  def initialize(name, age, parent_permission)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = rand(1..1000)
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def to_s
    "[#{self.class}] name: #{name}, ID: #{id}, age: #{age}\n"
  end
end
