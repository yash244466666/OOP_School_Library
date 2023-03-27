require_relative 'decorator'

class TrimmerDecorator < Decorator
  MAX_NAME_LENGTH = 10

  def correct_name
    name = @nameable.correct_name
    name.length > MAX_NAME_LENGTH ? name[0...MAX_NAME_LENGTH] : name
  end
end
