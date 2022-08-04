def parse_response(response)
  is_data_ok = false if %w[n N].include? response
  is_data_ok = true if %w[y Y].include? response

  is_data_ok
end

def generate_id(container)
  new_id_found = false
  new_id = 0

  until new_id_found
    new_id = rand(1...1000)
    new_id_found = true
    container.each do |person|
      if person.id == new_id
        new_id_found = false
        break
      end
    end
  end
  new_id
end
