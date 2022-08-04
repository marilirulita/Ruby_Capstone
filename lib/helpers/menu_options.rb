require_relative 'object_creation'
require_relative 'preserve_data'

def list_all(arr, label)
  puts ""
  puts "List of all #{label}"
  puts 'id | title | author | genre | source'
  puts '____________________________________'
  arr.each do |item|
    print "#{item.id} | "
    print "#{item.label.title} | "
    print "#{item.author.name} "
    print "#{item.author.last_name} | "
    print "#{item.genre.name} | "
    print "#{item.source.name} \n"
  end
  run
end

def list_all_genre(arr, label)
  puts ""
  puts "List of all #{label}"
  puts 'id | name'
  puts '___________'
  arr.each do |item|
    print "#{item.id} | "
    print "#{item.name} \n"
  end
  run
end

def load_data(arr, file)
  data = recover_data(file)
  data = arr if data.nil?
  data
end

def add_element(element, container)
  case element
  when 'Movie'
    movie_id = generate_id(container)
    container << create_movie(movie_id)
  when 'Music Album'
    container << create_music
    save_data(container, 'music_album')
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
