require './rental'
require './book'
require './person'
require 'rspec'

describe Rental do
  let(:book) { Book.new('Harry Potter', 'J.K. Rowling') }
  let(:person) { Person.new('John Doe') }
  let(:rental) { Rental.new('2022-01-01', book, person) }

  describe '#to_s' do
    it 'returns a string with the rental details' do
      expect(rental.to_s).to eq "Rentals:\nDate: 2022-01-01, Book: \"Harry Potter\" by J.K. Rowling"
    end
  end

  describe '#date' do
    it 'returns the rental date' do
      expect(rental.date).to eq '2022-01-01'
    end
  end

  describe '#book' do
    it 'returns the rental book' do
      expect(rental.book).to eq book
    end
  end

  describe '#person' do
    it 'returns the rental person' do
      expect(rental.person).to eq person
    end
  end
end
