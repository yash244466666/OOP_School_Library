require './person'
RSpec.describe Person do
  describe '#initialize' do
    it 'creates a person with an ID, name, age, and an empty rentals array' do
      person = Person.new(25, 'John')
      expect(person.id).to be_an(Integer)
      expect(person.name).to eq('John')
      expect(person.age).to eq(25)
      expect(person.rentals).to eq([])
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      person = Person.new(25, 'John')
      expect(person.correct_name).to eq('John')
    end

    it 'returns a capitalized name when decorated with CapitalizeDecorator' do
      person = Person.new(25, 'john')
      decorator = CapitalizeDecorator.new(person)
      expect(decorator.correct_name).to eq('John')
    end

    it 'returns a trimmed name when decorated with TrimmerDecorator' do
      person = Person.new(25, 'John Doe')
      decorator = TrimmerDecorator.new(person)
      expect(decorator.correct_name).to eq('John Doe')
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      person = Person.new(25)
      expect(person.can_use_services?(18)).to eq(true)
    end

    it 'returns true if the person has parent permission' do
      person = Person.new(16)
      expect(person.can_use_services?(18)).to eq(true)
    end

    it "returns false if the person is underage and doesn't have parent permission" do
      person = Person.new(16)
      expect(person.can_use_services?(18)).to eq(true)
    end
  end

  describe '#add_rental' do
    it "adds a rental to the person's rentals array" do
      person = Person.new(25)
      book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
      rental = person.add_rental(book, Date.today)
      expect(person.rentals).to eq([rental])
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the person' do
      person = Person.new(25, 'John')
      expect(person.to_s).to eq("[Person] name: John, ID: #{person.id}, age: 25\n")
    end
  end
end
