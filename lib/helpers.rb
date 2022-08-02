require_relative 'classes/movie'
require_relative 'classes/genre'
require_relative 'classes/label'
require_relative 'classes/author'
require_relative 'classes/movie'
require 'date'

def list_all(arr, label)
  puts "List of all #{label}"
  print 'title | author | genre | source'
  arr.each_with_index do |item, index|
    print (index + 1).to_s
    print "#{item.label.title} | "
    print "#{item.author.first_name} "
    print "#{item.author.last_name} | "
    print "#{item.genre.name} | "
    print "#{item.source.name} \n"
  end
end

def add_element(element)
  puts "Here is the method to add element #{element}"
end

def exit
  puts 'Thanks for using this App'
def generate_id
  rand(1..1000)
end

def create_movie
  id = generate_id
  publish_date = ask_publish_date
  archived = ask_archived
  silet = ask_is_silet
  movie = Movie.new()
end

def ask_publish_date
  print 'Publish date [yyyy-mm-dd]: '
  date = gets.chomp
  return date
end

def ask_archived
  print 'Is archived? [Ss/Nn]: '
  response = gets.chomp
  
  parse_response(response)
end

def ask_is_silet
  print 'Is silet? [Ss/Nn]: '
  response = gets.chomp

  parse_response(response)
end

def create_genre
  id = generate_id
  print 'Genre: '
  name = gets.chomp

  Genre.new(id, name)
end

def create_source
  id = generate_id
  print 'Source: '
  name = gets.chomp

  Source.new(id, name)
end

def create_label
  id = generate_id
  print 'Title: '
  title = gets.chomp
  print 'Color: '
  color = gets.chomp

  Label.new(id, title, color)
end

def create_author
  id = generate_id
  print 'First name: '
  name = gets.chomp
  print 'Last name: '
  las_name = gets.chomp

  Author.new(id, name, las_name)
end

def parse_response(response)
  is_data_ok = false if %w[n N].include? response
  is_data_ok = true if %w[y Y].include? response

  is_data_ok
end