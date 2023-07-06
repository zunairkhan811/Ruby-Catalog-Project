class App
  def invalid_option
    puts 'Invalid option'
  end

  def exit_app
    puts '============================='
    puts 'Thank you for using this app!'
    puts '============================='
    exit
  end

  def options
    puts 'Please enter one of the ff numbers to perform its corresponding task'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - List all genres (e.g "Comedy", "Thriller")'
    puts '5 - List all labels (e.g. "Gift", "New")'
    puts '6 - List all authors (e.g. "Stephen King")'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '10 - Exit'
  end
end
