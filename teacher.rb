require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parents_permission = 'true')
    super(age, name, parents_permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
