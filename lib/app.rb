require_relative 'helpers'

class App
  def initialize
    @books_list = []
    @music_list = []
    @movies_list = []
    @games_list = []
    @genres_list = []
    @labels_list = []
    @authors_list = []
    @sources_list = []
  end

  def menu_options
    [
      { id: 1, text: 'List all books', method: 'list_all(@books_list, "Books")' },
      { id: 2, text: 'List all music albums', method: 'list_all(@music_list, "Music")' },
      { id: 3, text: 'List all movies', method: 'list_all(@movies_list, "Movies")' },
      { id: 4, text: 'List all games', method: 'list_all(@games_list, "Games")' },
      { id: 5, text: 'List all genres', method: 'list_all(@genres_list, "Genres")' },
      { id: 6, text: 'List all labels', method: 'list_all(@labels_list, "Labels")' },
      { id: 7, text: 'List all authors', method: 'list_all(@authors_list, "Authors")' },
      { id: 8, text: 'List all sources', method: 'list_all(@sources_list, "Sources")' },
      { id: 9, text: 'Add a book', method: 'add_element("Book")' },
      { id: 10, text: 'Add a music album', method: 'add_element("Music Album")' },
      { id: 11, text: 'Add a movie', method: 'add_element("Movie")' },
      { id: 12, text: 'Add a game', method: 'add_element("Game")' },
      { id: 13, text: 'Exit', method: 'exit' }
    ]
  end

  def show_menu
    menu_options.each do |option|
      print "#{option[:id]}) #{option[:text]} \n"
    end
  end

  def run
    show_menu
    print 'Option: '
    op = gets.chomp.to_i

    menu_options.each do |option|
      instance_eval(option[:method]) if op == option[:id]
    end
  end
end
