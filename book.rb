class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author)
    @id = rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals << rental
    rental
  end

  def to_s
    "Title: #{@title}, Author: #{@author}\n"
  end
end
