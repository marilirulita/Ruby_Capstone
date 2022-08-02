require_relative 'helpers'

class App
  def initialize
    @menu_options = [
      'List all books',
      'List all music albums',
      'List all movies',
      'List all games',
      'List all genres',
      'List all labels',
      'List all authors',
      'List all sources',
      'Add a book',
      'Add a music album',
      'Add a movie',
      'Add a game',
      'Exit'
    ]
    @books_list = []
    @music_list = []
    @movies_list = []
    @genres_list = []
    @labels_list = []
    @authors_list = []
    @sources_list = []
  end

  def show_menu
    @menu_options.each_with_index do |option, index|
      print "#{index + 1}) #{option} \n" 
    end
  end

  def run
    show_menu
    print 'Option: '
    op = gets.chomp.to_i

    case(op)
    when 1 
      print 'List all books'
    when 2 
      print 'List all music albums'
    when 3 
      print 'List all movies'
    when 4 
      print 'List all games'
    when 5 
      print 'List all genres'
    when 6 
      print 'List all labels'
    when 7 
      print 'List all authors'
    when 8 
      print 'List all sources'
    when 9 
      print 'Add a book'
    when 10 
      print 'Add a music album'
    when 11 
      print 'Add a movie'
    when 12 
      print 'Add a game'
    when 13
      exit
    else 'Choose a valid option'
    end
  end
end