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
  end

  def show_menu
    @menu_options.each_with_index do |option, index|
      print "#{index + 1}) #{option} \n" 
    end
  end

  def run
    show_menu
    print "Option: "
    op = gets.chomp.to_i

    case(op)
    when 1 
      print "something"
    when 2 
      print "something"
    when 3 
      print "something"
    when 4 
      print "something"
    when 5 
      print "something"
    when 6 
      print "something"
    when 7 
      print "something"
    when 8 
      print "something"
    when 9 
      print "something"
    when 10 
      print "something"
    when 11 
      print "something"
    when 12 
      print "something"
    end
  end
end