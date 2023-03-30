require './person'

class Teacher < Person
  def initialize(_age, specialization, _classroom, _name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
