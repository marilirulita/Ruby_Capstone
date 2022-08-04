require_relative 'object_creation'
require_relative 'preserve_data'

def list_all(arr, label, data)
  puts ''
  puts "List of all #{label}"
  puts 'id | title | author | genre | source'
  puts '____________________________________'
  arr.each do |item|
    print "#{item.id} | "
    # print "#{item.label.title} | "
    # print "#{item.author.name} "
    # print "#{item.author.last_name} | "
    print "#{item.genre.name} | "
    # print "#{item.source.name} \n"
  end
  run
end

def loop_method(arr, id)
  arr.map do |e|
    e if e.id == id
  end
end

def add_missing_data(item, data)
  return unless item.genre.is_a?(Integer)

  genreobj = loop_method(data[:genres_list], item.genre)
  item.add_genre(genreobj[0])

  # labelobj = loop_method(data[:labels_list], item.label)
  # item.add_label(labelobj[0])

  # authorobj = loop_method(data[:authors_list], item.author)
  # item.add_author(authorobj[0])

  # sourceobj = loop_method(data[:sources_list], item.source)
  # item.add_source(sourceobj[0])
end

def list_all_genre_source(arr)
  puts ''
  puts 'List of all genres'
  puts 'id | name'
  puts '___________'
  arr.each do |item|
    print "#{item.id} | "
    print "#{item.name} \n"
  end
  run
end

def list_all_label(arr)
  puts ''
  puts 'List of all labels'
  puts 'id | title | color'
  puts '___________'
  arr.each do |item|
    print "#{item.id} | "
    print "#{item.title} | "
    print "#{item.color} \n"
  end
  run
end

def list_all_author(arr)
  puts ''
  puts 'List of all authors'
  puts 'id | name | last name'
  puts '___________'
  arr.each do |item|
    print "#{item.id} | "
    print "#{item.name} | "
    print "#{item.last_name} \n"
  end
  run
end

def add_element(element, state)
  case element
  when 'Movie'
    add_movie_to(state)
  when 'Music Album'
    add_music_album_to(state)
  else
    raise NoMethodError, "There's no method for this option"
  end
  run
end

def exit
  puts 'Thanks for using this App'
end

def option_not_available
  puts 'That is not a valid option, please select an available option'
  run
end

def add_movie_to(state)
  movie_id = generate_id_for(state[:movies_list])
  new_movie = create_movie(movie_id, state)
  state[:movies_list] << new_movie
  add_to_state(new_movie, state)
end

def add_music_album_to(state)
  music_album_id = generate_id_for(state[:music_list])
  new_album = create_music(music_album_id, state)
  state[:music_list] << new_album
  add_to_state(new_album, state)
end

def add_to_state(item, state)
  state[:authors_list] << item.author
  state[:genres_list] << item.genre
  state[:sources_list] << item.source
  state[:labels_list] << item.label
end
