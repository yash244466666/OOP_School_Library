require './classroom'
require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, _parent_permission, name = 'unknown')
    super(name, age, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
