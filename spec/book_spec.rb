require './book'
require 'date'

RSpec.describe Book do
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { double('Person') }

  describe '#initialize' do
    it 'creates a new Book instance with a title and author' do
      expect(book.title).to eq('Title')
      expect(book.author).to eq('Author')
    end

    it 'initializes rentals as an empty array' do
      expect(book.rentals).to eq([])
    end
  end

  describe '#to_s' do
    it "returns a string representation of the book's title and author" do
      expect(book.to_s).to eq("Title: Title, Author: Author\n")
    end
  end
end
