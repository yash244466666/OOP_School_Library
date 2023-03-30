require './nameable'
require './rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @rentals = []
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def can_use_services?(_is_of_age)
    return unless is_of_age? || @parent_permission

    true
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    return unless @age >= 18

    true
  end
end

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[0...10]
  end
end
