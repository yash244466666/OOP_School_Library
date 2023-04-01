require './classroom'

RSpec.describe Classroom do
  describe '#add_student' do
    it "adds a student to the classroom's student list" do
      classroom = Classroom.new('Math')
      student = Student.new('John Doe', 25, 'male')
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it "sets the student's classroom attribute to the classroom object" do
      classroom = Classroom.new('Math')
      student = Student.new('John Doe', 25, 'male')
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
