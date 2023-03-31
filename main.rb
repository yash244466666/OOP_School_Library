require './app'

class Menu
  def initialize(app)
    @app = app
    @options = {
      'List all books' => :list_books,
      'List all people' => :list_people,
      'Create a person' => :create_person,
      'Create a book' => :create_book,
      'Create a rental' => :create_rental,
      'List all rentals for a given person id' => :list_rentals_by_person_id,
      'Exit' => :exit
    }
    @app.load_data
  end

  def display
    puts 'Welcome to School Library App!'

    loop do
      option = _menu_option
      method = @options[option]
      if method == :exit
        @app.save_data
        puts 'Thank you for using this app!'
        break
      else
        @app.send(method)
      end
    end
  end

  private

  def _menu_option
    puts 'Please choose an option by entering a number:'
    @options.each_with_index { |(option, _), index| puts "#{index + 1}. #{option}" }

    option = gets.chomp.to_i
    option -= 1
    if option >= 0 && option < @options.size
      @options.keys[option]
    else
      puts 'That option is in valid'
      _menu_option
    end
  end
end

Menu.new(App.new).display
