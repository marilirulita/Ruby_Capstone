require_relative 'object_creation'
require_relative 'preserve_data'

def list_all(arr, label)
  data = load_data(arr, label)

  puts "List of all #{label}"
  print 'title | author | genre | source'
  data.each_with_index do |item, index|
    print (index + 1).to_s
    print "#{item.label.title} | "
    print "#{item.author.first_name} "
    print "#{item.author.last_name} | "
    print "#{item.genre.name} | "
    print "#{item.source.name} \n"
  end
  run
end

def load_data(arr, file)
  data = recover_data(file)
  data = arr if data.nil?
  data
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
  new_album = create_music(music_album_id)
  state[:music_list] << new_album
  add_to_state(new_album, state)
end

def add_to_state(item, state)
  state[:authors_list] << item.author
  state[:genres_list] << item.genre
  state[:sources_list] << item.source
  state[:labels_list] << item.label
end
