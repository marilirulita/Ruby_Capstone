require_relative 'object_creation'
require_relative 'preserve_data'

def list_all(arr, label)
  data = recover_data(label)
  data = arr if data.nil?

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

def add_element(element, container)
  case element
  when 'Movie'
    container << create_movie
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
