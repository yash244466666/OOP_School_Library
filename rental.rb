class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def to_s
    "Rentals:\nDate: #{@date}, Book: \"#{@book.title}\" by #{@book.author}"
  end
end
