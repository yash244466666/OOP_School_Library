require './person'

class Student < Person
  def initialize(classroom, age, name = 'Unknown', parents_permission = 'true')
    super(age, name, parents_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
