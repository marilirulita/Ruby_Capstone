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
