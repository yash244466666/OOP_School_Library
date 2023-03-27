require_relative 'nameable'

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
    super().capitalize
  end
end

class TrimmerDecorator < Decorator
  MAXIMUM_NAME_LENGTH = 10

  def correct_name
    super()[0, MAXIMUM_NAME_LENGTH]
  end
end
