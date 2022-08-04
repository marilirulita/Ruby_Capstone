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
    save_data(@state[:books_list], 'books_list')
    save_data(@state[:music_list], 'music_list')
    save_data(@state[:movies_list], 'movies_list')
    save_data(@state[:games_list], 'games_list')
    save_data(@state[:genres_list], 'genres_list')
    save_data(@state[:labels_list], 'labels_list')
    save_data(@state[:authors_list], 'authors_list')
    save_data(@state[:sources_list], 'sources_list')
  end

  def load_data
    # @state[:books_list] = recover_data('books_list').nil? ? [] : recover_data('books_list')
    # @state[:music_list] = recover_data('music_list').nil? ? [] : recover_data('music_list')
    # @state[:movies_list] = recover_data('movies_list').nil? ? [] : recover_data('movies_list')
    # @state[:games_list] = recover_data('games_list').nil? ? [] : recover_data('games_list')
    # @state[:genres_list] = recover_data('genres_list').nil? ? [] : recover_data('genres_list')
    # @state[:labels_list] = recover_data('labels_list').nil? ? [] : recover_data('labels_list')
    # @state[:authors_list] = recover_data('authors_list').nil? ? [] : recover_data('authors_list')
    # @state[:sources_list] = recover_data('sources_list').nil? ? [] : recover_data('sources_list')
  end
end
