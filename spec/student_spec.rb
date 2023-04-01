require './student'

RSpec.describe Student do
  describe '#play_hooky' do
    it 'returns the correct string' do
      student = Student.new(16, 'Math', true, 'John')
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  describe '#classroom=' do
    it "sets the student's classroom and adds the student to the classroom's students list" do
      classroom = Classroom.new('Math')
      student = Student.new(16, 'History', true, 'John')
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to include(student)
    end
  end
end
