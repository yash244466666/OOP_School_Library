require './app'

class Main
  MENU_OPTIONS = {
    1 => { message: 'List all books', method: :list_books },
    2 => { message: 'List all people', method: :list_people },
    3 => { message: 'Create a person', method: :create_person },
    4 => { message: 'Create a book', method: :create_book },
    5 => { message: 'Create a rental', method: :create_rental },
    6 => { message: 'List rentals for a given person id', method: :list_rentals },
    7 => { message: 'Quit', method: :quit }
  }.freeze

  def initialize
    @app = App.new
  end

  def display_menu
    puts "Welcome to the School Library App\n\n"
    MENU_OPTIONS.each { |key, value| puts "#{key}. #{value[:message]}" }
    puts "\nPlease choose an option by entering a number:\n"
  end

  def run
    loop do
      display_menu
      option = gets.chomp.to_i
      selected_option = MENU_OPTIONS[option]

      if selected_option
        puts @app.send(selected_option[:method])
      else
        puts "Invalid option. Please try again.\n\n"
      end
    end
  end

  private

  def quit
    "Thank you for using the School Library App!\n\n"
  end
end

Main.new.run
