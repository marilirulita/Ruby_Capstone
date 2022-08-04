require_relative './helpers/menu_options'
require_relative './helpers/preserve_data'

class App
  def initialize
    @state = {
      books_list: [],
      music_list: [],
      movies_list: [],
      games_list: [],
      genres_list: [],
      labels_list: [],
      authors_list: [],
      sources_list: []
    }
  end

  def options
    [
      { id: 1, text: 'List all books', method: 'list_all(@state[:books_list], "Books")' },
      { id: 2, text: 'List all music albums', method: 'list_all(@state[:music_list], "Music Album")' },
      { id: 3, text: 'List all movies', method: 'list_all(@state[:movies_list], "Movies")' },
      { id: 4, text: 'List all games', method: 'list_all(@state[:games_list], "Games")' },
      { id: 5, text: 'List all genres', method: 'list_all_genre_source(@state[:genres_list], "Genres")' },
      { id: 6, text: 'List all labels', method: 'list_all_label(@state[:labels_list], "Labels")' },
      { id: 7, text: 'List all authors', method: 'list_all_author(@state[:authors_list], "Authors")' },
      { id: 8, text: 'List all sources', method: 'list_all_genre_source(@state[:sources_list], "Sources")' },
      { id: 9, text: 'Add a book', method: 'add_element("Book")' },
      { id: 10, text: 'Add a music album', method: 'add_element("Music Album", @state)' },
      { id: 11, text: 'Add a movie', method: 'add_element("Movie", @state)' },
      { id: 12, text: 'Add a game', method: 'add_element("Game")' },
      { id: 13, text: 'Exit', method: 'exit' }
    ]
  end

  def show_menu
    puts ''
    puts 'Please select one of the following:'
    puts ''
    options.each do |option|
      print "#{option[:id]}) #{option[:text]} \n"
    end
  end

  def run
    show_menu
    puts ''
    print 'Option number: '
    op = gets.chomp.to_i

    if op.positive? && op <= options.length
      options.map do |option|
        instance_eval(option[:method]) if op == option[:id]
      end
    else
      option_not_available
    end

    save_state
  end

  def save_state
    save_data(@state[:books_list], 'genres')
    save_data(@state[:music_list], 'music_albums')
    save_data(@state[:movies_list], 'movies')
    save_data(@state[:games_list], 'games')
    save_data(@state[:genres_list], 'genres')
    save_data(@state[:labels_list], 'labels')
    save_data(@state[:authors_list], 'authors')
    save_data(@state[:sources_list], 'sources')
  end

  def load_data
    @state[:books_list] = recover_data('genres')
    @state[:music_list] = recover_data('music_albums')
    @state[:movies_list] = recover_data('movies')
    @state[:games_list] = recover_data('games')
    @state[:genres_list] = recover_data('genres')
    @state[:labels_list] = recover_data('labels')
    @state[:authors_list] = recover_data('authors')
    @state[:sources_list] = recover_data('sources')
  end
end
