require_relative '../classes/movie'
require_relative '../classes/book'
require_relative '../classes/music_album'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/author'
require_relative '../classes/source'
require_relative 'helpers'

def create_movie(movie_id, state)
  id = movie_id
  publish_date = ask_publish_date
  archived = ask_archived
  silet = ask_is_silet

  movie = Movie.new(publish_date, id, archived: archived, silet: silet)
  item_setters(movie, state)

  movie
end

def create_music(music_id, state)
  id = music_id
  publish_date = ask_publish_date
  archived = ask_archived
  spotify = on_spotify?

  album = MusicAlbum.new(publish_date, spotify, id, archived: archived)
  item_setters(album, state)
  album
end

def item_setters(item, state)
  puts 'Please select the author info'
  author = create_author(state)
  item.add_author(author)

  puts 'Please select genre info'
  genre = create_genre(state)
  item.add_genre(genre)

  puts 'Please select source info'
  source = create_source(state)
  item.add_source(source)

  puts 'Please select label info'
  label = create_label(state)
  item.add_label(label)
end

def ask_publish_date
  puts 'Type publish date'
  print 'Publish date [yyyy-mm-dd]: '
  gets.chomp
end

def ask_archived
  puts 'Select if is already archived'
  print 'Is archived? [Yy/Nn]: '
  response = gets.chomp

  parse_response(response)
end

def ask_is_silet
  print 'Is silet? [Yy/Nn]: '
  response = gets.chomp

  parse_response(response)
end

def on_spotify?
  print 'Is this album on spotify? [Yy/Nn]'
  response = gets.chomp

  parse_response(response)
end

def create_genre(state)
  id = generate_id_for(state[:genres_list])
  print 'Genre name: '
  name = gets.chomp

  Genre.new(name, id)
end

def create_source(state)
  id = generate_id_for(state[:sources_list])
  print 'Source name: '
  name = gets.chomp

  Source.new(name, id)
end

def create_label(state)
  id = generate_id_for(state[:labels_list])
  print 'Label title: '
  title = gets.chomp
  print 'Label color: '
  color = gets.chomp

  Label.new(title, color, id)
end

def create_author(state)
  id = generate_id_for(state[:authors_list])
  print 'Author first name: '
  name = gets.chomp
  print 'Author last name: '
  last_name = gets.chomp

  Author.new(name, last_name, id)
end

def create_book(book_id, state)
  id = book_id
  publish_date = ask_publish_date
  archived = ask_archived
  cover_state = ask_cover_state
  publisher = ask_publisher

  book = Book.new(publisher, cover_state, publish_date, archived, id)
  item_setters(book, state)
  book
end
