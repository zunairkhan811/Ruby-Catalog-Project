def menu(app)
  app.options
  print 'input: '
  gets.chomp.to_i
end

def intro
  puts '===================================='
  puts 'Welcome to Catalog of My Things App!'
  puts '===================================='
end

def manage_selection(app, option)
  tasks = {
    1 => :list_books,
    2 => :list_music_albums,
    3 => :list_games,
    4 => :list_genres,
    5 => :list_labels,
    6 => :list_authors,
    7 => :add_book,
    8 => :add_music_album,
    9 => :add_game,
    10 => :exit_app,
    default: :invalid_option
  }

  selection = tasks[option] || tasks[:default]
  app.send(selection)
end

def initial(app)
  intro
  loop do
    option = menu(app)
    manage_selection(app, option)
    puts "\n"
  end
end
