require './teacher'
RSpec.describe Teacher do
  describe '#initialize' do
    it 'sets the specialization attribute correctly' do
      teacher = Teacher.new(30, 'Math', '101')
      expect(teacher.specialization).to eq('Math')
    end
    it 'sets the classroom attribute correctly' do
      teacher = Teacher.new(30, 'Math', '101')
      expect(teacher.classroom).to eq('101')
    end
  end
  describe '#can_use_services?' do
    it 'returns true' do
      teacher = Teacher.new(30, 'Math', '101')
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
