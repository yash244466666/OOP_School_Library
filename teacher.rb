require './person'

class Teacher < Person
  def initialize(age, specialization, classroom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    @classroom = classroom
  end

  attr_reader :specialization, :classroom

  def can_use_services?
    true
  end
end
