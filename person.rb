class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unkown', parents_permission = 'true')
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parents_permission = parents_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_service?
    of_age? || @parents_permissiom
  end
end
