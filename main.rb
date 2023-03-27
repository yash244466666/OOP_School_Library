require_relative 'app'

class Main
  def initialize
    @app = App.new
    @hash = init_hash
  end

  def init_hash
    {
      1 => proc { @app.list_books },
      2 => proc { @app.list_people },
      3 => proc { @app.create_person },
      4 => proc { @app.create_book },
      5 => proc { @app.create_rental },
      6 => proc { @app.list_rentals },
      7 => proc {
        puts 'Thank you for using this app!'
        exit
      }
    }
  end

  def display_menu
    puts 'Welcome to school library App'
    puts 'Please choose an option to enter in a number'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a given person id'
    puts "7. Quit\n"
  end

  def run
    loop do
      display_menu
      option = gets.chomp.to_i

      puts @hash[option].call
      puts "\n"
    end
  end
end

main = Main.new
main.run
