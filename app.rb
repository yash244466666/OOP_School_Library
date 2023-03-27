require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'person'
require 'date'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def run(_menu)
    loop do
      display_menu
      choice = gets.chomp.to_i
      case choice
      when 1 then list_books
      when 2 then list_people
      when 3 then create_person
      when 4 then create_book
      when 5 then create_rental
      when 6 then list_rentals_for_person
      when 7
        puts 'Thanks for using this app'
        exit
      else puts 'Invalid option, try again.'
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def list_books
    puts 'List of all books:'
    @books.each do |_book|
      puts
    end
  end

  def list_people
    puts 'List of all people:'
    @people.each do |_person|
      puts
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or teacher (2)? [Input the number]'
    choice = gets.chomp.to_i
    case choice
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option, try again.'
    end
    puts
  end

  def create_student
    puts 'Creating a new student...'
    puts 'Enter student name:'
    name = gets.chomp
    puts 'Enter student age:'
    age = gets.chomp.to_i
    puts 'Does the student have parent permission? (y/n)'
    parent_permission = gets.chomp.downcase == 'y'
    student = Student.new(name, age, parent_permission)
    @people << student
    puts "#{student.name} has been added to the system.\n"
    puts
  end

  def create_teacher
    puts 'Creating a new teacher...'
    puts 'Enter teacher name :'
    name = gets.chomp
    puts 'Enter teacher age:'
    age = gets.chomp.to_i
    puts 'Enter teacher specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(name, age, specialization)
    @people << teacher
    puts "#{teacher.name} has been added to the system.\n"
    puts
  end

  def create_book
    puts 'Creating a new book...'
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "#{book.title} has been added to the system.\n"
    puts
  end

  def create_rental
    book = select_book
    person = select_person
    start_date = select_start_date
    rental = Rental.new(book, person, start_date)
    @rentals << rental
    puts "Rental created successfully\n"
    puts
  end

  def select_book
    puts 'Select a book from the following list (enter the corresponding number):'
    @books.each.with_index(1) do |book, i|
      puts "#{i}. #{book.title} by #{book.author}"
    end
    book_choice = gets.chomp.to_i
    book = @books[book_choice - 1]
    if book.nil?
      puts 'Invalid book selection.'
      return select_book
    end
    book
  end

  def select_person
    puts 'Select a person from the following list (enter the corresponding number):'
    @people.each.with_index(1) do |person, i|
      puts "#{i}. [#{person.class}] name: #{person.name}, ID: #{person.id}, age: #{person.age}"
    end
    person_choice = gets.chomp.to_i
    person = @people[person_choice - 1]
    if person.nil?
      puts 'Invalid person selection.'
      return select_person
    end
    person
  end

  def select_start_date
    puts 'Enter the date the rental starts (yyyy-mm-dd):'
    Date.parse(gets.chomp)
  rescue ArgumentError
    puts 'Invalid date format.'
    select_start_date
  end

  def list_rentals
    puts 'Enter the ID of the person:'
    person_id = gets.chomp.to_i
    person = find_person_by_id(person_id)
    if person.nil?
      puts "Person with ID #{person_id} does not exist, cannot list rentals."
      return
    end
    rentals = @rentals.select { |rental| rental.person == person }
    rentals.each do |_rental|
      puts
    end
  end

  def find_person_by_id(id)
    @people.find { |person| person.id == id }
  end

  def find_book_by_id(id)
    @books.find { |book| book.id == id }
  end

  def find_rental_by_id(id)
    @rentals.find { |rental| rental.id == id }
  end
end
